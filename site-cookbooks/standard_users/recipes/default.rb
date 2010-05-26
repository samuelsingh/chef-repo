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

package "libshadow-ruby1.8" do
  action :install
end

group "sysadmin"  do
  gid 10009
end

user "sysadmin"  do
  comment "Standard Sysadmin User"
  uid "10009"
  home "/var/shared/home/sysadmin"
  shell "/bin/bash"
  supports :manage_home => true
  password "$6$EftNV8G/$Z9PfDF/ss6.FGFyJLE8oeFGXfD9g20Bf72m6D5ShhImW3NIAzXx91y3D9uCU.cvtH0N/2a/VRjIxJp7bpN2nH."
  not_if "[ ! -z \"`who | grep sysadmin`\" ]"
end
