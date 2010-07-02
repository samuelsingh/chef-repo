#
# Cookbook Name:: jira
# Recipe:: default
#
# Copyright 2008-2009, Opscode, Inc.
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

#
# Manual Steps!
#
# MySQL:
#
#   create database jiradb character set utf8;
#   grant all privileges on jiradb.* to '$jira_user'@'localhost' identified by '$jira_password';
#   flush privileges;
include_recipe "java"
include_recipe "tomcat"

remote_file "/etc/init.d/tomcat9002" do
  source "tomcat9002"
  mode 0755
end

template "#{node[:jira][:install_path]}/conf/server.xml" do
  source "server.xml.erb"
  mode 0755
end

template "#{node[:jira][:install_path]}/conf/Catalina/localhost/jira.xml" do
  source "jira.xml.erb"
  mode 0755
end

template "#{node[:jira][:install_path]}/conf/Catalina/localhost/manager-jira.xml.erb" do
  source "manager-jira.xml.erb"
  mode 0755
end
 
