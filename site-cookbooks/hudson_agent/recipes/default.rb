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

agent_home = "#{node[:hudson_agent][:home_dir]}"
server_url = "#{node[:hudson_agent][:server_url]}"
user = "#{[:hudson_agent][:user]}"
group = "#{[:hudson_agent][:group]}"

max_heap   = "#{[hudson_agent][:jvm][:max_heap]}"
start_heap = "#{[hudson_agent][:jvm][:start_heap]}"


group "#{group}" do
  gid 10099
end

user "#{user}" do
  comment "Hudson Agent"
  uid "10099"
  gid "10099"
  home "#{agent_home}"
  shell "/bin/bash"
  not_if "[ ! -z \"`who | grep hudson-agent`\" ]"
end

directory "#{agent_home}" do
  owner "#{user}"
  group "#{group}"
  mode "0755"
  action :create
  not_if "test -d {agent_home}"
end

template "/etc/init.d/hudson-agent" do
  source "hudson-agent.erb"
  owner "root"
  group "root"
  mode "0755"
  variables(
    :server_url => server_url,
    :agent_home => agent_home,
    :user => user,
    :group => group,
    :max_heap => max_heap,
    :start_heap => start_heap
  )
end

service "hudson-agent" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable ]
end


