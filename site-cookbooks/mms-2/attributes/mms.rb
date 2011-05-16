#
# Cookbook Name:: tomcat
# Attributes:: tomcat
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

# Old attributes

# Settings for cs-tools
set_unless[:mms][:cstools][:path] = "/var/mms/cs-tools"

# Settings for batchProcessing
set_unless[:mms][:queuemgr][:path] = "/var/mms/queue-manager"


## New attributes

# Attributes common to all recipes
set_unless[:mms][:common][:base] = '/var/mms'
set_unless[:mms][:common][:interactive_usr] = 'root'
set_unless[:mms][:common][:dbuser] = "mtmuser"
set_unless[:mms][:common][:dbpass] = "medic1"
set_unless[:mms][:common][:dbhost] = "db"
set_unless[:mms][:common][:fqdn] = "mms.md-cloud-01.eu"
set_unless[:mms][:common][:quova_svr] = "geoip.map-cloud-01.eu"

# Used by m2mr2-cs-base.properties
set_unless[:mms][:application][:deployment_name] = "unset" # Should be either "Client MMS" or "Map of Medicine Root MMS"
set_unless[:mms][:application][:deployment][:id] = "0" # Should be set appropriately in JSON properties
set_unless[:mms][:application][:deployment][:external_start] = "0" # Should be set appropriately in JSON properties
set_unless[:mms][:application][:deployment][:external_end] = "0" # Should be set appropriately in JSON properties
set_unless[:mms][:application][:quartz][:user] = "quartz@mapofmedicine.com"
set_unless[:mms][:application][:quartz][:password] = "password"
set_unless[:mms][:application][:preview_time] = "22:00" # Format is HH:MM
set_unless[:mms][:application][:athens_link] = "true" # True for Client MMS, false for Root MMS
set_unless[:mms][:application][:multiple_views] = "true" # True for Client MMS, false for Root MMS

# Settings for the jackrabbit repository
set_unless[:mms][:application][:datastore] = true # True for everywhere except Client MMS
set_unless[:mms][:application][:repository][:dbuser] = node[:mms][:common][:dbuser]
set_unless[:mms][:application][:repository][:dbpass] = node[:mms][:common][:dbpass]
set_unless[:mms][:application][:repository][:dbhost] = node[:mms][:common][:dbhost]
set_unless[:mms][:application][:repository][:dbname] = "crx"

# Settings for the mcs database
set_unless[:mms][:application][:mapmanager][:dbuser] = node[:mms][:common][:dbuser]
set_unless[:mms][:application][:mapmanager][:dbpass] = node[:mms][:common][:dbpass]
set_unless[:mms][:application][:mapmanager][:dbhost] = node[:mms][:common][:dbhost]
set_unless[:mms][:application][:mapmanager][:dbname] = "mcs"

# Settings for the mappreview database
set_unless[:mms][:application][:mom][:dbuser] = node[:mms][:common][:dbuser]
set_unless[:mms][:application][:mom][:dbpass] = node[:mms][:common][:dbpass]
set_unless[:mms][:application][:mom][:dbhost] = node[:mms][:common][:dbhost]
set_unless[:mms][:application][:mom][:dbname] = "mappreview"
