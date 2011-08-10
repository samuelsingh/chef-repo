#
# Cookbook Name:: standard_users
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

shared_homes = '/var/shared/home'
shared_user_home = "#{shared_homes}/sysadmin"
File.directory?(shared_homes) ? home_dir = shared_user_home : home_dir = '/home/sysadmin'

package "libshadow-ruby1.8" do
  action :install
end

user "sysadmin"  do
  comment "Standard Sysadmin User"
  uid "10009"
  home home_dir
  shell "/bin/bash"
  supports :manage_home => true
  password "$6$omSzYslD$MzOq5M8cCCAoDZgS4L0y3JpSIrnPloUrC0WWW6c137k1K8DewKKpcvCNVsXKyAPYUYpK7J23N3Z9lrUoae0Bt0"
#  not_if "[ ! -z \"`who | grep sysadmin`\" ]"
end

remote_file "#{home_dir}/.profile" do
  source "profile"
  owner "sysadmin"
  group "sysadmin"
  mode "0644"
end

