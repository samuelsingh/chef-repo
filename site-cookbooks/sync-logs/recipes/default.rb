#
# Cookbook Name:: sync-logs
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

ssh_home = "/var/shared/home/sysadmin/.ssh"
sync_user = "sysadmin"

package "libshadow-ruby1.8" do
  action :install
end

# Probably a better way to do this if the functionality
# is needed once the Orchard disappears

#group "syncuser" do
#  gid 10028
#end

#user "syncuser"  do
#  comment "Managed by Chef"
#  uid "10028"
#  gid "syncuser"
#  home "/home/syncuser"
#  shell "/bin/bash"
#  supports :manage_home => true
#  password "$1$MwZZayys$wutrFm0TLDrsLR1Z4/jQl/"
#  not_if "[ ! -z \"`who | grep syncuser`\" ]"
#end

directory "#{ssh_home}" do
  owner "#{sync_user}"
  group "#{sync_user}"
  mode "0700"
  action :create
end

remote_file "#{ssh_home}/id_rsa.pub" do
  source "ssh/id_rsa.pub"
  owner "#{sync_user}"
  group "#{sync_user}"
  mode "0644"
end

remote_file "#{ssh_home}/id_rsa" do
  source "ssh/id_rsa"
  owner "#{sync_user}"
  group "#{sync_user}"
  mode "0600"
end

remote_file "/usr/local/sbin/sync-logs" do
  source "sync-logs"
  owner "root"
  group "root"
  mode "0755"
end

template "/etc/cron.d/sync-logs" do
  source "cron-template.erb"
  mode 0644
  owner "root"
  group "root"
end