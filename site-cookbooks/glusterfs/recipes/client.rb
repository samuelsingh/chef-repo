#
# Cookbook Name:: glusterfs
# Recipe:: client
#
# Copyright 2010, Map of Medicine
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

mounts = node[:glusterfs][:client][:mounts]
glustersrvs = search(:node, "glusterfs_server:true").map { |n| n["fqdn"] }

# Reverses the glustersrvs list depending on ip address, to add some randomness
# to the mount order
#
glustersrvs = glustersrvs.reverse if node[:ipaddress].gsub(".", "").to_i.odd?

package "glusterfs-client" do
  case node[:platform]
  when "debian","ubuntu"
    package_name "glusterfs-client"
  end
  action :install
end

# Loads the fuse module if this hasn't
# already happened
#
execute "modprobe fuse" do
  command "modprobe fuse"
  action :run
  not_if "lsmod | grep fuse > /dev/null"
end

# Creates base mount directory
#
directory "/gfs" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  not_if "test -d /gfs"
end

unless glustersrvs.empty?

  mounts.each do |mount|
    
    directory "/gfs/#{mount}" do
      owner "root"
      group "root"
      mode "0755"
      action :create
      not_if "test -d /gfs/#{mount}"
    end
    
    if glustersrvs[1].nil?
      
      mount "/gfs/#{mount}" do
        device "#{glustersrvs[0]}:export_#{mount}"
        fstype "glusterfs"
        options "direct-io-mode=disable,noatime"
        action [:mount, :enable]
        not_if "test -f /gfs/#{mount}/.gfs"
      end
      
    else
      
      mount "/gfs/#{mount}" do
        device "#{glustersrvs[0]}:export_#{mount}"
        fstype "glusterfs"
        options "backupvolfile-server=#{glustersrvs[1]},direct-io-mode=disable,noatime"
        action [:mount, :enable]
        not_if "test -f /gfs/#{mount}/.gfs"
      end
      
    end
  
  end

end