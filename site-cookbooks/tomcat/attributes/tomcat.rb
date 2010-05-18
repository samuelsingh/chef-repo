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

set_unless[:tomcat][:global_inf_base] = "/var/shared/global/infrastructure"
set_unless[:tomcat][:role] = "app-server"
set_unless[:tomcat][:version] = "apache-tomcat-6.0.18-mom"
set_unless[:tomcat][:ajp_ports] = [ 9001, 9002 ]
set_unless[:tomcat][:basedir] = "/var/tomcat"