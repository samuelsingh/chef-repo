#
# Cookbook Name:: foxdev_mounts
# Recipe:: default
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

package "portmap" do
  action :install
end

package "nfs-kernel-server" do
  action :install
end

execute "exportfs" do
  command "exportfs -ra" 
  action :nothing
end

nfsmounts = Array.new

# Creates an array of mountpoint and network
# /home 192.168.0.0/255.255.255.0

node[:nfs_server][:mounts].each do |name,params|
  
  if defined?(params.fetch("share")) && defined?(params.fetch("network"))
    nfsmounts << [params.fetch("share"), params.fetch("network")].join(' ')
  end
  
end

template "/etc/exports" do
  source "exports.erb"
  mode 0644
  owner "root"
  group "root"
  variables(
    :nfsmounts => nfsmounts
  )
  notifies :run, resources(:execute => "exportfs")
end
