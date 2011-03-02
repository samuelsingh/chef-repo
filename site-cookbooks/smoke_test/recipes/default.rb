#
# Cookbook Name:: smoke_test
# Recipe:: default
#
# Copyright 2011, Map of Medicine
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

agent_user = 'ubuntu'
agent_group = 'ubuntu'

['cucumber','firewatir','headless'].each do |pkg|
  gem_package pkg do
    action :install
  end
end

package "xvfb" do
  action :install
end

# Deploy firefox application
execute "deploy_firefox" do
  command "cd /usr/local && tar xjf /var/tmp/firefox-3.6.13.tar.bz2"
  action :nothing
end

# Grab firefox data files, if they're not already in place
remote_file "/var/tmp/firefox-3.6.13.tar.bz2" do
  source "firefox-3.6.13.tar.bz2"
  backup false
  mode "0644"
  notifies :run, resources(:execute => "deploy_firefox")
  not_if "test -f /usr/local/firefox/run-mozilla.sh"
end

directory "/home/#{agent_user}/.mozilla" do
  owner agent_user
  group agent_group
  mode "0755"
  recursive true
  action :create
end

remote_directory "/home/#{agent_user}/.mozilla/firefox" do
  source 'firefox-profile'
  owner agent_user
  group agent_group
end
