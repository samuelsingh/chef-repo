#
# Cookbook Name:: exim
# Recipe:: satellite
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

package "exim4" do
  action :install
end

execute "update-exim4" do
  command "update-exim4.conf && sleep 1" 
  action :nothing
end

template "/etc/mailname" do
  source "mailname.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:execute => "update-exim4")
end

template "/etc/exim4/update-exim4.conf.conf" do
  source "update-exim4.conf.conf.erb"
  mode 0644
  owner "root"
  group "root"
  variables(
    :deployment => "satellite"
  )
  notifies :run, resources(:execute => "update-exim4")
end

remote_file "/etc/exim4/passwd.client" do
  source "passwd.client"
  mode 0640
  owner "root"
  group "Debian-exim"
  notifies :run, resources(:execute => "update-exim4")
end

remote_file "/etc/exim4/exim4.conf.localmacros" do
  source "exim4.conf.localmacros"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:execute => "update-exim4")
end
