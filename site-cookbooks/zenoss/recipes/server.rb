#
# Cookbook Name:: zenoss
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

mount "/usr/local/zenoss" do
  device "/dev/sdh1"
  fstype "ext3"
  action [:mount, :enable]
  only_if "test -b /dev/sdh1"
end

group "zenoss"  do
  gid 11010
end

group "mysql"  do
  gid 11011
end

user "zenoss"  do
  comment "Zenoss"
  uid "10010"
  gid "zenoss"
  home "/home/zenoss"
  shell "/bin/bash"
  supports :manage_home => true
  not_if "[ ! -z \"`who | grep zenoss`\" ]"
end

user "mysql"  do
  comment "Mysql"
  uid "10011"
  gid "mysql"
  home "/home/mysql"
  shell "/bin/bash"
  supports :manage_home => true
  not_if "[ ! -z \"`who | grep mysql`\" ]"
end

template "/etc/init.d/zenoss-stack" do
  source "zenoss-stack.erb"
  mode 0755
  owner "root"
  group "root"
end

service "zenoss-stack" do
  action :start
end