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

agent_user = 'root'
agent_group = 'root'

# Rubygems 1.3.6 needs an earlier version of hoe
gem_package 'hoe' do
  action :install
  version "2.6.2"
end

gem_package 'json' do
  action :install
  version "1.4.6"
end

gem_package 'cucumber' do
  action :install
  version "1.8.5"
end

['commonwatir','firewatir'].each do |pkg|
  gem_package pkg do
    action :install
  end
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

if agent_user == 'root'
  home_dir = '/root'
else
  home_dir = "/home/#{agent_user}"
end

# Deploy firefox application
execute "deploy_firefox_profile" do
  command "cd #{home_dir} && tar xzf /var/tmp/#{profile_pkg} && chown -R #{agent_user}:#{agent_group} .mozilla"
  action :nothing
end

# Grab firefox data files, if they're not already in place
remote_file "/var/tmp/#{profile_pkg}" do
  source profile_pkg
  backup false
  mode "0644"
  notifies :run, resources(:execute => "deploy_firefox_profile")
  not_if "test -d #{home_dir}/.mozilla"
end