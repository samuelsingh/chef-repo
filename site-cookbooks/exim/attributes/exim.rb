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

# Transitional values based on the zone name attribute.,  We shouldn't use this anymore.
#

case node[:zones][:name]
  
when "dummy"
  set[:exim][:smarthost] = 'mail.dummy.com'
  
when "foxdev"
  set[:exim][:smarthost] = 'mail.dummy.com'
  
when "euaws"
  set[:exim][:smarthost] = 'smarthost-01.map-cloud-01.eu'
  
end


case node[:domain]

when "map-cloud-01.eu"
  set[:exim][:smarthost] = 'smarthost-01.map-cloud-01.eu'
end
