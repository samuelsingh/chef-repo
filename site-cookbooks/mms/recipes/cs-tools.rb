#
# Cookbook Name:: mms
# Recipe:: cs-tools
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

cstools    = node[:mms][:cstools][:path]
version    = node[:mms][:version]
deploy_dir = node[:mms][:deploy_dir]


directory "#{cstools}/config"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{cstools}/config"
end

remote_file "#{cstools}/cs-tools.sh" do
  source "cs-tools/cs-tools.sh"
  mode "0755"
end

# cs-tools doesn't actually use values from this
#
template "#{cstools}/config/mom.properties" do
  source "mom/mom.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mompath => "/tmp",
    :fqdn => "unset"
  )
end

template "#{cstools}/config/m2mr2-cs-deployment.properties" do
  source "cs-tools/m2mr2-cs-deployment.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

template "#{cstools}/config/repository.properties" do
  source "cs-tools/repository.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

link "#{cstools}/config/m2mr2-cs-base.properties"  do
  to "#{node[:mms][:mapmanager][:path]}/config/m2mr2-cs-base.properties"
  only_if "test -f #{node[:mms][:mapmanager][:path]}/config/m2mr2-cs-base.properties"
end

remote_file "#{cstools}/config/auto-approve.properties" do
  source "cs-tools/config/auto-approve.properties"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

remote_file "#{cstools}/config/log4j.xml" do
  source "cs-tools/config/log4j.xml"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

remote_file "#{cstools}/config/m2mr2-cs-spring.properties" do
  source "cs-tools/config/m2mr2-cs-spring.properties"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
end

link "#{cstools}/lib"  do
  to "#{deploy_dir}/cs-tools-#{version}/lib"
  only_if "test -d #{deploy_dir}/cs-tools-#{version}"
end

link "#{cstools}/lib"  do
  to "#{deploy_dir}/cs-tools-#{version}/archive"
  only_if "test -d #{deploy_dir}/cs-tools-#{version}"
end