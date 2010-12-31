#
# Cookbook Name:: tgt-iscsi
# Recipe:: default
#
# Copyright 2010, Andrew Fulcher
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# This is a simple recipe used to create an iscsi backing store for a SQL Server 2005 instance
# Required because Windows software RAID I/O performance is very poor.
#
# Recommended configuration for databases is to use RAID 10, with a 256k stripe, and 6 equally-sized
# EBS volumes.  Manually create and add the EBS devices to an EC2 instance, then create the array
# using something like:
#
# mdadm -v --create /dev/md0 --chunk=256 --level=raid10 --raid-devices=6 /dev/sdd /dev/sde /dev/sdf /dev/sdg /dev/sdh /dev/sdi
#
# Note that the recipe just assembles the array from the devices it's told about, so any other config
# will work fine.
#
# Then to use the recipe, set node[:tgt_iscsi][:volumes] to be an array of strings of the form
# "ebs_vol_name,/dev/sd*", so something like: ["vol-abcdef,/dev/sdd","vol-123456,/dev/sde"]
#
# If using chef-solo, you might want to just hardcode this in the volumes variable below.
#

volumes = node[:tgt_iscsi][:volumes]

# Install mdadm package
package "mdadm" do
  action :install
end

# List of block devices, used by the assemble command
blkdevs = Array.new

# Mounts volumes

volumes.each do |entry|
  
  # Volume entry should be something like
  # "ebs_vol_name,/dev/sd*"
  
  ebs_id = entry.split(",")[0]
  blkdev = entry.split(",")[1]
  
  aws_ebs_volume "#{ebs_id}" do
    provider "aws_ebs_volume"
    aws_access_key node[:aws][:aws_access_key]
    aws_secret_access_key node[:aws][:aws_secret_access_key]
    volume_id ebs_id
    availability_zone node[:ec2][:placement_availability_zone]
    device blkdev
    action :attach
    not_if "test -b #{blkdev}"
  end
  
end

# Assemble software RAID array
# Creates a lockfile, so that this is only done on first launch

execute "assemble_raid" do
  command "mdadm --assemble /dev/md0 #{blkdevs.join(' ')}"
  action :nothing
end

template "/var/lock/assemble_raid"  do
  mode "0644"
  source "assemble_raid.erb"
  notifies :run, resources(:execute => "assemble_raid"), :immediately
end

# Grabs the tgt package and installs it.
# Uses the Natty package in Ubuntu. See for details:
# https://bugs.launchpad.net/ubuntu/+source/tgt/+bug/574554
# This should be improved if the updated package ever makes it to lucid-backports.
#

if node[:kernel][:machine] == "x86_64"
  tgt_pkg = "tgt_1.0.4-2ubuntu1_amd64.deb"
else
  tgt_pkg = "tgt_1.0.4-2ubuntu1_i386.deb"
end

remote_file "/tmp/#{tgt_pkg}" do
  source "#{tgt_pkg}"
  backup false
  mode "0644"
  not_if "test -f /tmp/#{tgt_pkg}"
end

package "/tmp/#{tgt_pkg}" do
  action :install, :immediately
end

# Finally, configure up tgtd

execute "assemble_raid" do
  command "tgt-admin --update ALL"
  action :nothing
end

template "/etc/tgt/target.conf" do
  source "target.conf.erb"
  mode "0644"
  variables(
    :rev_hostname => node[:fqdn].split('.').reverse.join('.')
  )
  notifies :run, resources(:execute => "tgt_apply_changes")
end
