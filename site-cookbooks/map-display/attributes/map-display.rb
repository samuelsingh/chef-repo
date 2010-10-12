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

set_unless[:map_display][:mtmpath] = "/var/mtm"
set_unless[:map_display][:md_fqdn] = "app.md-cloud-01.eu"
set_unless[:map_display][:deploy_dir] = "/var/shared/deployment/app"
set_unless[:map_display][:version] = "1.1.1.MD.1"
set_unless[:map_display][:webapp_dir] = "#{node[:map_display][:deploy_dir]}/md-#{node[:map_display][:version]}/webapps"

set_unless[:map_display][:dbuser] = "mtmuser"
set_unless[:map_display][:dbpass] = "medic1"
set_unless[:map_display][:dbhost] = "db"
set_unless[:map_display][:dbname] = "mtmdb"

set_unless[:map_display][:contentloaderpath] = "/usr/local/contentloader"
