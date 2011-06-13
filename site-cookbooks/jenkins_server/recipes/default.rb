#
# Cookbook Name:: jenkins_server
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

hudson_home = "#{node[:jenkins_server][:home]}"
run_user    = "#{node[:jenkins_server][:run_user]}"

directory "#{node[:tomcat][:basedir]}/server9001/webapps" do
	owner "tomcat"
	group "tomcat"
	mode "0755"
	action :create
	not_if "test -d #{node[:tomcat][:basedir]}/server9001/webapps"
end

template "#{node[:jenkins_server][:install_path]}/conf/Catalina/localhost/hudson.xml" do
  source "hudson.xml.erb"
  owner "root"
  group "root"
  mode 0755
end

template "#{node[:tomcat][:basedir]}/server9001/etc/java_opts.conf" do
  source "java_opts.conf.erb"
  owner "root"
  group "root"
  mode 0644
end


directory "#{hudson_home}"  do
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{hudson_home}"
  owner "#{run_user}"
  group "#{run_user}"
end

mount "#{hudson_home}" do
  device "/dev/sdh1"
  fstype "ext3"
  action [:mount, :enable]
  only_if "test -b /dev/sdh1"
end

package "maven2" do
  action :install
end

