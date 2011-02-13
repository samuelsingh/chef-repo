#
# Cookbook Name:: hudson_agent
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

hudson_home = "#{node[:hudson_agent][:home_dir]}"
server_url  = "#{node[:hudson_agent][:server_url]}"
user        = "#{node[:hudson_agent][:user]}"
group       = "#{node[:hudson_agent][:group]}"

max_heap    = "#{node[:hudson_agent][:jvm][:max_heap]}"
start_heap  = "#{node[:hudson_agent][:jvm][:start_heap]}"

package "unzip" do 
  action :install 
end


group "#{group}" do
  gid 10099
  not_if "grep #{group} /etc/group > /dev/null"
end

user "#{user}" do
  comment "Hudson Agent"
  uid "10099"
  gid 10099
  home "#{hudson_home}"
  shell "/bin/bash"
  not_if "grep #{user} /etc/passwd > /dev/null"
end

directory "#{hudson_home}" do
  owner "#{user}"
  group "#{group}"
  mode "0755"
  action :create
  not_if "test -d {hudson_home}"
end

directory "/mnt/hudson-workspace" do
  owner "#{user}"
  group "#{group}"
  mode "0755"
  action :create
  not_if "test -d /mnt/hudson-workspace"
end

link "#{hudson_home}/workspace" do
  to "/mnt/hudson-workspace"
end

template "/etc/init.d/hudson-agent" do
  source "hudson-agent.erb"
  owner "root"
  group "root"
  mode "0755"
  variables(
    :server_url => server_url,
    :hudson_home => hudson_home,
    :user => user,
    :group => group,
    :max_heap => max_heap,
    :start_heap => start_heap
  )
end

service "hudson-agent" do
  supports :status => true, :start => true, :restart => true, :reload => true
  running true
  action [ :enable, :start ]
end


