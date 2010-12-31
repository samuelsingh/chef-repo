#
# Cookbook Name:: tgt-iscsi
# Recipe:: default
#
# Copyright 2010, Map of Medicine
#
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
  
  aws_ebs_volume "#{name}" do
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
# Uses the Maverick package in Lucid. See for details:
# https://bugs.launchpad.net/ubuntu/+source/tgt/+bug/574554
# This should be updated if the later package ever makes it to lucid-backports.

remote_file "/tmp/tgt_1.0.4-2ubuntu1_amd64.deb" do
  source "tgt_1.0.4-2ubuntu1_amd64.deb"
  backup false
  mode "0644"
  not_if "test -f /tmp/tgt_1.0.4-2ubuntu1_amd64.deb"
end

package "/tmp/tgt_1.0.4-2ubuntu1_amd64.deb" do
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