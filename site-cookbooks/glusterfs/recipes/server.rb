#
# Cookbook Name:: glusterfs
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

mounts = node[:glusterfs][:server][:mounts]
glustersrvs = search(:node, "glusterfs_server:true").map { |n| n["fqdn"] }

package "glusterfs-server" do
  case node[:platform]
  when "debian","ubuntu"
    package_name "glusterfs-server"
  end
  action :install
end

service "glusterfsd" do
  case node[:platform]
  when "debian","ubuntu"
    service_name "glusterfsd"
  end
  supports value_for_platform(
    "default" => { "default" => [:restart, :reload ] }
  )
  action :enable
end

directory "/gfs" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  not_if "test -d /gfs"
end

mounts.each do |mount|
  
  directory "/gfs/#{mount}" do
    owner "root"
    group "root"
    mode "0755"
    action :create
    not_if "test -d /gfs/#{mount}"
  end
  
  template "/etc/glusterfs/#{mount}.vol" do
    source "export-TEMPLATE.vol.erb"
    owner "root"
    group "root"
    mode 0644
    variables(
      :mount_point => mount,
      :glustersrvs => glustersrvs
    )
    notifies :restart, resources(:service => "glusterfsd")
  end
  
end

template "/etc/glusterfs/glusterfsd.vol" do
  source "glusterfsd.vol.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
    :mount_points => mounts
  )
  notifies :restart, resources(:service => "glusterfsd")
end


