#
# Cookbook Name:: jira
# Attributes:: jira
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

# type-version-standalone
set_unless[:jira][:version]           = "atlassian-jira-4.1.2"
set_unless[:jira][:install_path]      = "/var/tomcat/server9002"
set_unless[:jira][:run_user]          = "tomcat"
set_unless[:jira][:database]          = "mysql"
set_unless[:jira][:database_host]     = "jiradb"
set_unless[:jira][:database_user]     = "jira_user"
set_unless[:jira][:database_password] = "medic1"
