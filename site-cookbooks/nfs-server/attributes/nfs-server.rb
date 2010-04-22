# Cookbook Name:: nfs-server
# Attribute File:: nfs-server
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

case node[:zones][:name]
  
when "dummy"
  set[:nfs-server][:mounts] = {
    "dummy_mount" => {"share" => "/var/dummy", "network" => "192.168.1.1/255.255.255.0" }
  }
  
when "foxdev"
  set[:nfs-server][:mounts] = {
    "var_shared" => {"share" => "/home/exportfs", "network" => "192.168.35.0/255.255.255.0"}
  }
  
when "euaws"
  set[:nfs-server][:mounts] = {
    "var_shared" => {"share" => "/var/shared", "network" => "#{node[:ipaddress]}/255.255.254.0"}
  }
  
end