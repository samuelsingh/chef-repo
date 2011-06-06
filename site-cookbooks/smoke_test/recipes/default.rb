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

node[:hudson_agent][:user].nil? ? agent_user = 'root' : agent_user = node[:hudson_agent][:user]
node[:hudson_agent][:group].nil? ? agent_group = 'root' : agent_group = node[:hudson_agent][:group]

# Rubygems 1.3.6 needs an earlier version of hoe
gem_package 'hoe' do
  action :install
  version "2.6.2"
end

# Pinning cucumber to specific versions, as it was enough
# of a nightmare getting it to work in the first place...
#

gem_package 'json' do
  action :install
  version "1.4.6"
end

gem_package 'gherkin' do
  action :install
  version "2.3.10"
end

gem_package 'cucumber' do
  action :install
  version "0.10.2"
end

gem_package 'commonwatir' do
  action :install
  version "1.8.0"
end

gem_package 'firewatir' do
  action :install
  version "1.8.0"
end

package "tightvncserver" do
  action :install
end

package "firefox" do
  action :install
end

if node[:kernel][:machine] == "x86_64"
  profile_pkg = "mozilla-jssh-lucid-64.tar.gz"
else
  profile_pkg = "mozilla-jssh-lucid-32.tar.gz"
end

# Deploy firefox application
execute "deploy_firefox_profile" do
  command "cd ~#{agent_user} && tar xzf /var/tmp/#{profile_pkg} && chown -R #{agent_user}:#{agent_group} .mozilla"
  action :nothing
end

# Grab firefox data files, if they're not already in place
remote_file "/var/tmp/#{profile_pkg}" do
  source profile_pkg
  backup false
  mode "0644"
  notifies :run, resources(:execute => "deploy_firefox_profile")
  not_if "test -d ~#{agent_user}/.mozilla"
end