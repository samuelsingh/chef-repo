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

cl_path = node[:map_display][:contentloader][:path]
cl_dist = node[:map_display][:contentloader][:dist_path]

dbuser = node[:map_display][:common][:dbuser]
dbpass = node[:map_display][:common][:dbpass]
dbhost = node[:map_display][:common][:dbhost]
dbname = node[:map_display][:common][:dbname]
dbtype = node[:map_display][:common][:dbtype]

# Gives us somewhere to grab the contentloader from
directory "#{cl_dist}" do
  action :create
  recursive true
  not_if "test -d #{cl_dist}"
end

if File.exists?("#{cl_dist}/ContentLoader.zip")
  
  execute "deploy_contentloader" do
    command "rm -rf #{cl_path} && unzip #{cl_dist}/ContentLoader.zip -d #{cl_path}"
    action :nothing
  end
  
  # Checksum the contentloader
  execute "checksum_contentloader" do
    command "md5sum #{cl_dist}/ContentLoader.zip > #{cl_dist}/ContentLoader.zip.md5"
    notifies :run, resources(:execute => "deploy_contentloader"), :immediately
    not_if "md5sum -c --status #{cl_dist}/ContentLoader.zip.md5 > /dev/null"
  end
  
end

template "#{cl_path}/config/contentloader.properties" do
  source "contentloader/contentloader.properties.erb"
  variables(
    :contentloader_path => cl_path,
    :dbuser => dbuser,
    :dbpass => dbpass,
    :dbhost => dbhost,
    :dbname => dbname
  )
  only_if "test -d #{cl_path}"
end