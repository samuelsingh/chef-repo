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

mounts = node[:glusterfs][:mounts].sort

package "samba" do
  case node[:platform]
  when "debian","ubuntu"
    package_name "samba"
  end
  action :install
end

service "smbd" do
  case node[:platform]
  when "debian","ubuntu"
    service_name "smbd"
  end
  supports value_for_platform(
    "default" => { "default" => [:restart, :reload ] }
  )
  action :enable
end

user "custadmin" do
  comment "Allows custadmin access to shares"
  system "true"
  shell "/bin/false"
end

remote_file "/etc/samba/smbpasswd" do
  source "smbpasswd"
  owner "root"
  group "root"
  mode "0600"
  notifies :restart, resources(:service => "smbd")
end

template "/etc/samba/smb.conf" do
  source "smb.conf.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
    :mount_points => mounts
  )
  notifies :restart, resources(:service => "smbd")
end



