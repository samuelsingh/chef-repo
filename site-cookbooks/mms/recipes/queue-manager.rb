#
# Cookbook Name:: mms
# Recipe:: queue-manager
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

queuemgr   = node[:mms][:queuemgr][:path]
version    = node[:mms][:version]
deploy_dir = node[:mms][:deploy_dir]
content_in = node[:mms][:content_in]

directory "#{content_in}/import"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{content_in}/import"
end

directory "#{content_in}/scheduled"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{content_in}/scheduled"
end

directory "#{queuemgr}/config"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{queuemgr}/config"
end

remote_file "#{queuemgr}/queue-manager.sh" do
  source "queue-manager/queue-manager.sh"
  mode "0755"
end

directory "#{queuemgr}/logs"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{queuemgr}/logs"
end

template "#{queuemgr}/config/m2mr2-batch.properties" do
  source "cs-tools/m2mr2-batch.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :content_in => content_in
  )
end

remote_file "#{queuemgr}/config/log4j.xml" do
  source "cs-tools/config/log4j.xml"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

link "#{queuemgr}/lib"  do
  to "#{deploy_dir}/mms-#{version}/queue-manager/lib"
  only_if "test -d #{deploy_dir}/mms-#{version}"
end

link "#{queuemgr}/help"  do
  to "#{deploy_dir}/mms-#{version}/queue-manager/help"
  only_if "test -d #{deploy_dir}/mms-#{version}"
end