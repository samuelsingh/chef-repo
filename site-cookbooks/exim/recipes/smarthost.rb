#
# Cookbook Name:: exim
# Recipe:: smarthost
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

package "spamassassin" do
  action :install
end

package "sa-exim" do
  action :install
end

package "exim4" do
  action :install
end

execute "update-exim4" do
  command "update-exim4.conf && /etc/init.d/exim4 restart && sleep 1" 
  action :nothing
end

template "/etc/exim4/sa-exim.conf" do
  source "sa-exim.conf.erb"
  mode 0644
  owner "root" 
  group "root" 
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
    :deployment => "smarthost"
  )
  notifies :run, resources(:execute => "update-exim4")
end

template "/etc/exim4/exim4.conf.template" do
  source "exim4.conf.template.erb"
  mode 0644
  owner "root"
  group "root"
  variables(
    :deployment => "smarthost"
  )
  notifies :run, resources(:execute => "update-exim4")
end

remote_file "/etc/aliases" do
  source "aliases"
  mode 0644
  owner "root"
  group "root"
end

remote_file "/etc/exim4/passwd" do
  source "passwd"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:execute => "update-exim4")
end

remote_file "/etc/exim4/exim.crt" do
  source "exim.crt"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:execute => "update-exim4")
end

remote_file "/etc/exim4/exim.key" do
  source "exim.key"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:execute => "update-exim4")
end

remote_file "/etc/exim4/exim4.conf.localmacros" do
  source "exim4.conf.localmacros"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:execute => "update-exim4")
end
