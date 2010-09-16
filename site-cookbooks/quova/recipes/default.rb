#
# Cookbook Name:: quova
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

# A small recipe to install Quova 6.2

group "quova"  do
  gid 10020
end

user "quova"  do
  comment "quova"
  uid "10020"
  gid "quova"
  home "/home/quova"
  shell "/bin/bash"
  not_if "[ ! -z \"`who | grep quova`\" ]"
end

package "unzip" do
  action :install
end

# Deploy Quova application (removed because of issues with remote_directory)
# This should be the better way to do this, however.
#remote_directory "/usr/local/quova" do
#  source "quova"
#  files_backup 0
#  files_owner "quova"
#  files_group "quova"
#  files_mode "0644"
#  owner "quova"
#  group "quova"
#  mode "0755"
#end

# Deploy Quova application
execute "deploy_quova" do
  command "unzip /var/tmp/quova.zip -d /usr/local/quova && chown -R quova:quova /usr/local/quova"
  action :nothing
end

# Deploy Quova data files
execute "deploy_qvdata" do
  command "unzip /var/tmp/qvdata.zip -d /usr/local/quova/data/current && chown -R quova:quova /usr/local/quova"
  action :nothing
end

# Grab Quova data files, if they're not already in place
remote_file "/var/tmp/quova.zip" do
  source "qvdata/quova.zip"
  backup 0
  mode "0644"
  notifies :run, resources(:execute => "deploy_quova")
  not_if "test -f /usr/local/quova/GeoDirectoryServer.properties"
end

# Grab Quova data files, if they're not already in place
remote_file "/var/tmp/qvdata.zip" do
  source "qvdata/qvdata.zip"
  backup 0
  mode "0644"
  notifies :run, resources(:execute => "deploy_qvdata")
  not_if "test -f /usr/local/quova/data/current/VERSION"
end

# Adds a (very rudimentary) init script
remote_file "/etc/init.d/quova-server" do
  source "quova-server"
  backup 0
  mode "0755"
end

# Delete tmp data file if it's been deployed
file "/var/tmp/qvdata.zip" do
  action :delete
  only_if "test -f /usr/local/quova/data/current/VERSION"
end

# Delete tmp data file if it's been deployed
file "/var/tmp/quova.zip" do
  action :delete
  only_if "test -f /usr/local/quova/GeoDirectoryServer.properties"
end
