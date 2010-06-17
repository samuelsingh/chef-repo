#
# Cookbook Name:: users
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

group "sysadmin" do
  gid 10009
end

node[:users].each do |username,params|
  
  if params.defined?("home")
    user_home = params.fetch("home")
  else
    user_home = "/var/shared/home/#{username}"
  end

  user "#{username}"  do
    comment "Managed by Chef"
    uid "#{params.fetch("uid")}"
    gid "#{username}"
    home "#{user_home}"
    shell "/bin/bash"
    supports :manage_home => true
    password "#{params.fetch("pwd_hash")}"
    not_if "[ ! -z \"`who | grep #{username}`\" ]"
  end

  if params.fetch("is_admin") == "true"
    
    group "sysadmin" do
      members ["#{username}"]
      append true
    end
    
  end

end
