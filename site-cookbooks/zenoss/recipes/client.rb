#
# Cookbook Name:: zenoss
# Recipe:: client
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

zen_srv = search(:node, "zenoss_server:true").map { |n| n["fqdn"] }.first

http_request "add_host" do
  url "http://admin:noj4Ahe@#{zen_srv}:8080/zport/dmd/DeviceLoader/loadDevice?deviceName=#{node[:fqdn]}&zSnmpCommunity=#{node[:snmpd][:community]}&devicePath=/Server/Linux"
  action :nothing
end

template "/var/lock/zenoss-add"  do
  mode "0644"
  source "zenoss-add.erb"
  notifies :get, resources(:http_request => "add_host")
end