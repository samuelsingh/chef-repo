#
# Cookbook Name:: jenkins_agent
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

jenkins_home = "#{node[:jenkins_agent][:home_dir]}"
server_url  = "#{node[:jenkins_agent][:server_url]}"
user        = "#{node[:jenkins_agent][:user]}"
group       = "#{node[:jenkins_agent][:group]}"

java_opts    = "#{node[:jenkins_agent][:jvm][:java_opts]}"

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
  home "#{jenkins_home}"
  shell "/bin/bash"
  not_if "grep #{user} /etc/passwd > /dev/null"
end

directory "#{jenkins_home}" do
  owner "#{user}"
  group "#{group}"
  mode "0755"
  action :create
end

directory "/mnt/jenkins-workspace" do
  owner "#{user}"
  group "#{group}"
  mode "0755"
  action :create
end

link "#{jenkins_home}/workspace" do
  to "/mnt/jenkins-workspace"
end

template "/etc/init.d/jenkins-agent" do
  source "jenkins-agent.erb"
  owner "root"
  group "root"
  mode "0755"
  variables(
    :server_url => server_url,
    :jenkins_home => jenkins_home,
    :user => user,
    :group => group,
    :java_opts => java_opts
  )
end

service "jenkins-agent" do
  supports :status => true, :start => true, :restart => true, :reload => true
  running true
  action [ :enable, :start ]
end


