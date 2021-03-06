#
# Cookbook Name:: generic-vhost
# Attributes:: mms-vhost
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

set_unless[:generic_vhost] = {
  "unset.mapofmedicine.com" => {
    "srv_aliases" => [],
    "webapps" => {
      "webapp" => {
        "port" => "9000",
        "appserver" => "unset-app-01.map-cloud-01.eu",
        "document_root" => "/var/www/vhosts",
        "proxy_pass" => ["professional","choices"]
      }
    },
    "primary_webapp" => "webapp",
    "holding_page" => "false",
    "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause."
  }
}
