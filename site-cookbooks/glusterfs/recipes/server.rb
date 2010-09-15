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

mounts = node[:glusterfs][:mounts]
glustersrvs = search(:node, "glusterfs_server:true").map { |n| n["fqdn"] }.sort

package "glusterfs-server" do
  case node[:platform]
  when "debian","ubuntu"
    package_name "glusterfs-server"
  end
  action :install
end

service "glusterfs-server" do
  case node[:platform]
  when "debian","ubuntu"
    service_name "glusterfs-server"
  end
  supports value_for_platform(
    "default" => { "default" => [:restart, :reload ] }
  )
  action :enable
end

execute "clear_conf" do
  command "rm -rf /etc/glusterfs/*"
  action :run
  only_if "test -f /etc/glusterfs/glusterfs.vol"
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
  
  template "/etc/glusterfs/export_#{mount}.vol" do
    source "export-TEMPLATE.vol.erb"
    owner "root"
    group "root"
    mode 0644
    variables(
      :mount_point => mount,
      :glustersrvs => glustersrvs
    )
    notifies :restart, resources(:service => "glusterfs-server")
  end
  
end

exports = Array.new
mounts.each do |mount|
  exports << "export_#{mount}"
end

template "/etc/glusterfs/glusterfsd.vol" do
  source "glusterfsd.vol.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
    :mount_points => mounts,
    :exports => exports
  )
  notifies :restart, resources(:service => "glusterfs-server")
end


