#
# Cookbook Name:: map-display-vhost
# Attributes:: map-display-vhost
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

#set_unless[:map_display_vhost][:hostname] = "app.map-cloud-01.eu"
#set_unless[:map_display_vhost][:srv_aliases] = Array.new
#set_unless[:map_display_vhost][:deploy_dir] = "/var/shared/deployment/app"
#set_unless[:map_display_vhost][:appserver] = "md-app-01.map-cloud-01.eu"
#set_unless[:map_display_vhost][:tomcat_mgr_ips] = Array.new
#set_unless[:map_display_vhost][:holding_page] = "false"
#set_unless[:map_display_vhost][:is_load_balanced] = "false"
#set_unless[:map_display_vhost][:holding_page_msg] = "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause."

set_unless[:map_display_vhost] = {
  "unset-mms.mapofmedicine.com" => {
    "srv_aliases" => [],
    "deploy_dir" => "/var/shared/deployment/mms",
    "appserver" => "unset-mms-app-01.map-cloud-01.eu",
    "restricted_ips" => [],
    "holding_page" => "false",
    "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
    "lb_alive_port" => 0
  }
}
