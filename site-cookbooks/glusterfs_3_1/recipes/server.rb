#
# Cookbook Name:: glusterfs_3.1
# Recipe:: server
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

vol_base = node[:glusterfs][:vol_base]

# Installs package dependencies
["libibverbs1","nfs-common"].each do |pkg|
  package pkg do
    action :install
  end
end

if node[:kernel][:machine] == "x86_64"
  deb_pkg = "glusterfs_3.1.2-1_amd64.deb"
else
  log "GlusterFS server is only available for 64-bit saystems"
end

remote_file "/tmp/#{deb_pkg}" do
  source "package/#{deb_pkg}"
  backup false
  mode "0644"
  not_if "test -f /tmp/#{deb_pkg}"
end

dpkg_package "glusterfs-server" do
  source "/tmp/#{deb_pkg}"
  action :install
end

service "glusterd" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

directory "/gfs" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  not_if "test -d /gfs"
end

node.set[:glusterfs][:volumes] = Dir.entries(vol_base).map{|e| e unless (e == '.' || e == '..' || File.file?(e))}.compact

# Configure up node peering
if node[:glusterfs][:bootstrap] == "true"
  
  stores = search(:node, "glusterfs_node:true").map { |n| n["ipaddress"] }.sort
  
  stores.each do |store|
    
    execute "add_peer_if_missing" do
      command "gluster peer status | grep #{store} > /dev/null || gluster peer probe #{store} > /dev/null"
      action :run
    end
    
  end

  node[:glusterfs][:volumes].each do |v|
  
    # Find all nodes that advertise the mountpoint
    brickmaps = search(:node, "glusterfs_volumes:#{v}").map { |n| "#{n[:ipaddress]}:#{volbase}/#{v}" }.sort
    replicas = brickmaps.length
    
    execute "add_volume" do
      command "gluster volume create gluster-volume replica #{replicas} transport tcp #{brickmaps.join(' ')}"
      action :run
      only_if "gluster volume info gluster-volume | grep \"not present\" > /dev/null"
    end
    
    execute "online_volume"
      command "gluster volume start #{v}"
      action :run
      only_if "gluster volume info #{v} | grep Created > /dev/null"
    end

  end

end
  

