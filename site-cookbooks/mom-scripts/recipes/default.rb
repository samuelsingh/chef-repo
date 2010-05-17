#
# Cookbook Name:: mom-scripts
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

subversion "Standard /usr" do
  repository "http://svn.mapofmedicine.com/map-sys/branches/INFRASTRUCTURE_3.0/standard/ALL/usr"
  revision "1309"
  destination "/usr"
  svn_username "chef"
  svn_password "aiVahx7s"
  svn_info_args "--no-auth-cache"
  action :export
end

subversion "Standard /etc" do
  repository "http://svn.mapofmedicine.com/map-sys/branches/INFRASTRUCTURE_3.0/standard/ALL/etc"
  revision "HEAD"
  destination "/etc"
  svn_username "#{node[:mom_scripts][:svn_user]}"
  svn_password "#{node[:mom_scripts][:svn_pass]}"
  svn_info_args "--no-auth-cache"
  action :export
end

directory "/etc/map-fabric" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  not_if "test -d /etc/map-fabric"
end

template "zone-id" do
  path "/etc/map-fabric/zone-id"
  source "zone-id.erb"
  owner "root"
  group "root"
  mode 0644
  backup false
end
