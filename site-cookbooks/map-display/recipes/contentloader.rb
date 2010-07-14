#
# Cookbook Name:: map-display
# Recipe:: contentloader
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

contentloader_path = node[:map_display][:contentloaderpath]
deploy_dir = node[:map_display][:deploy_dir]
md_version = node[:map_display][:version]

dbuser = node[:map_display][:dbuser]
dbpass = node[:map_display][:dbpass]
dbhost = node[:map_display][:dbhost]
dbname = node[:map_display][:dbname]

directory "#{contentloader_path}/bin"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  action :create
  not_if "test -d #{contentloader_path}/bin"
end

directory "#{contentloader_path}/config"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  action :create
  not_if "test -d #{contentloader_path}/config"
end

directory "#{contentloader_path}/loader/failure"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  action :create
  not_if "test -d #{contentloader_path}/loader/failure"
end

directory "#{contentloader_path}/loader/input"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  action :create
  not_if "test -d #{contentloader_path}/loader/input"
end

directory "#{contentloader_path}/loader/success"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  action :create
  not_if "test -d #{contentloader_path}/loader/success"
end

directory "#{contentloader_path}/logs"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  action :create
  not_if "test -d #{contentloader_path}/logs"
end

remote_file "#{contentloader_path}/bin/contentloader.sh" do
  source "contentloader/contentloader.sh"
  mode 0755
  owner "root"
  group "root"
end

template "#{contentloader_path}/config/contentloader.properties" do
  source "contentloader/contentloader.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :contentloader_path => contentloader_path,
    :dbuser => dbuser,
    :dbpass => dbpass,
    :dbhost => dbhost,
    :dbname => dbname
  )
end

template "#{contentloader_path}/config/log4j.properties" do
  source "contentloader/log4j.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :contentloader_path => contentloader_path
  )
end

remote_file "#{contentloader_path}/config/mom.properties" do
  source "contentloader/mom.properties"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

remote_file "#{contentloader_path}/config/thesaurusSearchServiceManager.properties" do
  source "contentloader/thesaurusSearchServiceManager.properties"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

link "#{contentloader_path}/lib"  do
  to "#{deploy_dir}/md-#{md_version}/contentloader/lib"
  only_if "test -d #{deploy_dir}/md-#{md_version}"
end