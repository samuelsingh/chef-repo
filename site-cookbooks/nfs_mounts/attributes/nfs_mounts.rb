#
# Cookbook Name:: nfs_mounts
# Attribute File:: nfs_mounts
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
  set[:nfs_mounts] = {"dummy_mount" => {"host" => "dummyhost", "hostdir" => "/var/dummy", "clientdir" => "/var/clientdummy" }}
when "foxdev"
  set[:nfs_mounts] = {"var_shared" => {"host" => "192.168.35.18", "hostdir" => "/home/exportfs", "clientdir" => "/var/shared" }, "var_vmstore" => {"host" => "192.168.35.18", "hostdir" => "/var/vmstore", "clientdir" => "/var/vmstore" }}
end
