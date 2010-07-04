# Cookbook Name:: exim
# Attribute File:: exim
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

if recipe?("zenoss::server")
  set[:zenoss][:server] = "true"
end

if recipe?("zenoss::vhost")
  set_unless[:zenoss][:vhost][:hostname] = "unset.unset.com"
  set_unless[:zenoss][:vhost][:srv_aliases] = []
  set_unless[:apache][:restricted_ips] = []
end