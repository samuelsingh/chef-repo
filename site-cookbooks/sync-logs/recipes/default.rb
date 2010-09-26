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

package "libshadow-ruby1.8" do
  action :install
end

group "syncuser" do
  gid 10028
end

user "syncuser"  do
  comment "Managed by Chef"
  uid "10028"
  gid "syncuser"
  home "/home/syncuser"
  shell "/bin/bash"
  supports :manage_home => true
  password "$1$MwZZayys$wutrFm0TLDrsLR1Z4/jQl/"
  not_if "[ ! -z \"`who | grep syncuser`\" ]"
end