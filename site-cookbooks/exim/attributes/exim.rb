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

case node[:domain]

when "map-cloud-01.eu"
  set[:exim][:smarthost] = 'smarthost-01.map-cloud-01.eu'
end

# Sets a sensible default if something's wrong
set_unless[:exim][:smarthost] = 'default.map-cloud-01.eu'

# Give option of making relay networks configurable
set_unless[:exim][:relaynets] = ''
