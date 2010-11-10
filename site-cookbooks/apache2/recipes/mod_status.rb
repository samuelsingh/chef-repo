#
# Cookbook Name:: apache2
# Recipe:: status 
#
# Copyright 2008-2009, Opscode, Inc.
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

restricted_ips = node[:apache][:restricted_ips]

# Don't use indexes if run by chef-solo
if $0[/chef-solo/].nil?
  restricted_ips << search(:node, "zenoss_server:true").map { |n| n["ipaddress"] }.first
end

apache_module "status"

template "#{node[:apache][:dir]}/mods-available/status.conf" do
  source "mods/status.conf.erb"
  variables(
    :restricted_ips => restricted_ips
  )
  notifies :restart, resources(:service => "apache2")
end
