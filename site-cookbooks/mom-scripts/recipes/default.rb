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

execute "rsync_standard_usr"  do
  command "rsync -rlpv --exclude '.svn/' #{node[:mom_scripts][:global_inf_base]}/standard/ALL/usr/ /usr"
  action :run
  only_if "test -d #{node[:mom_scripts][:global_inf_base]}/standard/ALL/usr"
end

execute "rsync_standard_etc"  do
  command "rsync -rlpv --exclude '.svn/' #{node[:mom_scripts][:global_inf_base]}/standard/ALL/etc/ /etc"
  action :run
  only_if "test -d #{node[:mom_scripts][:global_inf_base]}/standard/ALL/etc"
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

remote_directory "/usr/local/devops" do
  source "devops"
  files_mode "0755"
  mode "0755"
end