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

set_unless[:mms][:fqdn] = "mms.md-cloud-01.eu"
set_unless[:mms][:deploy_dir] = "/var/shared/deployment/mms"
set_unless[:mms][:version] = "2.6.1.MMS.2"
set_unless[:mms][:logpath] = "/var/mms/logs"
set_unless[:mms][:contentpath] = "/var/mms/content"
set_unless[:mms][:deployment_name] = "unset" # Should be either "Client MMS" or "Map of Medicine Root MMS"
set_unless[:mms][:deployment][:id] = "0" # Should be set appropriately in JSON properties
set_unless[:mms][:deployment][:external_start] = "0" # Should be set appropriately in JSON properties
set_unless[:mms][:deployment][:external_end] = "0" # Should be set appropriately in JSON properties
set_unless[:mms][:quartz][:user] = "quartz@mapofmedicine.com"
set_unless[:mms][:quartz][:password] = "password"
set_unless[:mms][:preview_time] = "22:00" # Format is HH:MM
set_unless[:mms][:athens_link] = "true" # True for Client MMS, false for Root MMS
set_unless[:mms][:multiple_views] = "true" # True for Client MMS, false for Root MMS

set_unless[:mms][:dbuser] = "mtmuser"
set_unless[:mms][:dbpass] = "medic1"
set_unless[:mms][:dbhost] = "db"

# Settings for the mapmanager webapp config
set_unless[:mms][:mapmanager][:path] = "/var/mms/mapmanager"

# Settings for the mom/adminapp webapp config
set_unless[:mms][:mom][:path] = "/var/mms/mom"

# Settings for the previewloader webapp config
set_unless[:mms][:previewloader][:path] = "/var/mms/previewloader"

# Settings for the mappreview database
set_unless[:mms][:mom][:dbuser] = node[:mms][:dbuser]
set_unless[:mms][:mom][:dbpass] = node[:mms][:dbpass]
set_unless[:mms][:mom][:dbhost] = node[:mms][:dbhost]
set_unless[:mms][:mom][:dbname] = "mappreview"

# Settings for the mcs database
set_unless[:mms][:mapmanager][:dbuser] = node[:mms][:dbuser]
set_unless[:mms][:mapmanager][:dbpass] = node[:mms][:dbpass]
set_unless[:mms][:mapmanager][:dbhost] = node[:mms][:dbhost]
set_unless[:mms][:mapmanager][:dbname] = "mcs"

# Settings for the jackrabbit repository database
set_unless[:mms][:repository][:dbuser] = node[:mms][:dbuser]
set_unless[:mms][:repository][:dbpass] = node[:mms][:dbpass]
set_unless[:mms][:repository][:dbhost] = node[:mms][:dbhost]
set_unless[:mms][:repository][:dbname] = "crx"
