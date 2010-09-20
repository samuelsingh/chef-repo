#
# Cookbook Name:: hudson_server
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

directory "#{node[:tomcat][:basedir]}/server9001/webapps" do
	owner "tomcat"
	group "tomcat"
	mode "0755"
	action :create
	not_if "test -d #{node[:tomcat][:basedir]}/server9001/webapps"
end

template "#{node[:hudson_server][:install_path]}/conf/Catalina/localhost/hudson.xml" do
  source "hudson.xml.erb"
  mode 0755
end

template "#{node[:hudson_server][:install_path]}/conf/Catalina/localhost/manager-hudson.xml.erb" do
  source "manager-hudson.xml.erb"
  mode 0755
end
      

