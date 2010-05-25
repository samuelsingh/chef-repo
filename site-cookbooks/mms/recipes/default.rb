#
# Cookbook Name:: mms
# Recipe:: default
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

# Generates the mtm directory structure
#

# Variables
#
logpath         = node[:mms][:logpath]
contentpath     = node[:mms][:contentpath]
fqdn            = node[:mms][:fqdn]
deploy_dir      = node[:mms][:deploy_dir]
deployment_name = node[:mms][:deployment_name]
version         = node[:mms][:version]
athens_link     = node[:mms][:athens_link]
multiple_views  = node[:mms][:multiple_views]

mmpath = node[:mms][:mapmanager][:path]

previewpath = node[:mms][:previewloader][:path]

mompath = node[:mms][:mom][:path]
mom_dbuser = node[:mms][:mom][:dbuser]
mom_dbpass = node[:mms][:mom][:dbpass]
mom_dbhost = node[:mms][:mom][:dbhost]
mom_dbname = node[:mms][:mom][:dbname]

## Creates MMS common configuration directories

directory "#{mmpath}/logs"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{mmpath}/logs"
end

directory "#{contentpath}/md-packages"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{contentpath}/md-packages"
end

directory "#{contentpath}/sync-packages"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{contentpath}/sync-packages"
end

## Creates configuration directories for the mom webapp, used by full map preview

directory "#{mompath}"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{mompath}"
end

directory "#{mompath}/index"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  action :create
  not_if "test -d #{mompath}/index"
end

directory "#{mompath}/ipgIndex"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  action :create
  not_if "test -d #{mompath}/ipgIndex"
end

directory "#{mompath}/nelhIndex"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  action :create
  not_if "test -d #{mompath}/nelhIndex"
end

# Static directories
#

remote_directory "#{mompath}/athens" do
  source "athens"
  files_owner "sysadmin"
  files_group "sysadmin"
  files_mode "0644"
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
end

remote_directory "#{mompath}/ssl" do
  source "ssl"
  files_owner "sysadmin"
  files_group "sysadmin"
  files_mode "0644"
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
end

remote_directory "#{mompath}/thesaurusindex" do
  source "thesaurusindex"
  files_owner "sysadmin"
  files_group "sysadmin"
  files_mode "0644"
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
end

remote_directory "#{mompath}/translation" do
  source "translation"
  files_owner "sysadmin"
  files_group "sysadmin"
  files_mode "0644"
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
end

# Config files
#

directory "#{mompath}/config"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  action :create
  not_if "test -d #{mompath}/config"
end

template "#{mompath}/config/adminapp-log4j.xml" do
  source "mom/adminapp-log4j.xml.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mompath => logpath,
    :fqdn => fqdn
  )
end

template "#{mompath}/config/adminapp.properties" do
  source "mom/adminapp.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mompath => mompath,
    :fqdn => fqdn
  )
end

template "#{mompath}/config/mom-log4j.xml" do
  source "mom/mom-log4j.xml.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mompath => logpath,
    :fqdn => fqdn
  )
end

template "#{mompath}/config/mom.properties" do
  source "mom/mom.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mompath => mompath,
    :fqdn => fqdn
  )
end

## Creates configuration directories for the mapmanager webapp

directory "#{mmpath}/config"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{mmpath}/config"
end

template "#{mmpath}/config/cs-webservice.properties" do
  source "mapmanager/cs-webservice.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mmpath => mmpath,
    :fqdn => fqdn
  )
end

# Routine to figure out preview time values
previewvals = /[0]{0,1}([1|2|3|4|5|6|7|8|9]{0,1}\d):[0]{0,1}([1|2|3|4|5|6|7|8|9]{0,1}\d)/.match("#{node[:mms][:preview_time]}")

template "#{mmpath}/config/m2mr2-cs-base.properties" do
  source "mapmanager/m2mr2-cs-base.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mmpath => mmpath,
    :logpath => logpath,
    :contentpath => contentpath,
    :previewpath => previewpath,
    :deployment_name => deployment_name,
    :previewhour => previewvals[1],
    :previewmin => previewvals[2],
    :fqdn => fqdn
  )
end

template "#{mmpath}/config/MapEditorCentralConfig.xml" do
  source "mapmanager/MapEditorCentralConfig.xml.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mmpath => mmpath,
    :fqdn => fqdn
  )
end

template "#{mmpath}/config/mapmanager.properties" do
  source "mapmanager/mapmanager.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mmpath => mmpath,
    :fqdn => fqdn,
    :athens_link => athens_link,
    :multiple_views => multiple_views
  )
end

template "#{mmpath}/config/mapmanager-log4j.xml" do
  source "mapmanager/mapmanager-log4j.xml.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :logpath => logpath
  )
end

## Creates configuration directories for the previewloader webapp

directory "#{previewpath}/config"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{previewpath}/config"
end

directory "#{previewpath}/failure"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{previewpath}/failure"
end

directory "#{previewpath}/input"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{previewpath}/input"
end

directory "#{previewpath}/success"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{previewpath}/success"
end

directory "#{previewpath}/tmp"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{previewpath}/tmp"
end

template "#{previewpath}/config/previewloader-log4j.xml" do
  source "previewloader/previewloader-log4j.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :logpath => logpath
  )
end

template "#{previewpath}/config/contentloader.properties" do
  source "previewloader/contentloader.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :previewpath => previewpath,
    :mom_dbuser => mom_dbuser,
    :mom_dbpass => mom_dbpass,
    :mom_dbhost => mom_dbhost,
    :mom_dbname => mom_dbname
  )
  only_if "test -d #{previewpath}/config"
end

## Tomcat base configuration

link "#{deploy_dir}/webapps-running"  do
  to "#{deploy_dir}/webapps-#{version}"
  only_if "test -d #{deploy_dir}/webapps-#{version}"
end

if defined?(node[:tomcat][:ajp_ports]) && defined?(node[:tomcat][:basedir])
  
  node[:tomcat][:ajp_ports].each do |ajp_port|
    
    if ajp_port == 9001
      
      directory "#{node[:tomcat][:basedir]}/server9001/webapps" do
        owner "tomcat"
        group "tomcat"
        mode "0755"
        action :create
        not_if "test -d #{node[:tomcat][:basedir]}/server9001/webapps"
      end
      
      link "#{node[:tomcat][:basedir]}/server9001/webapps/mom"  do
        to "#{deploy_dir}/webapps-#{version}/mom"
        only_if "test -d #{deploy_dir}/webapps-#{version}"
      end
      
      template "#{node[:tomcat][:basedir]}/server9001/conf/Catalina/localhost/mom.xml" do
        source "mom/mom.xml.erb"
        mode 0644
        owner "sysadmin"
        group "sysadmin"
        variables(
          :mom_dbuser => mom_dbuser,
          :mom_dbpass => mom_dbpass,
          :mom_dbhost => mom_dbhost,
          :mom_dbname => mom_dbname
        )
        only_if "test -d #{node[:tomcat][:basedir]}/server9001/conf/Catalina/localhost"
      end
      
    end
    
    if ajp_port == 9002
      
      directory "#{node[:tomcat][:basedir]}/server9002/webapps" do
        owner "tomcat"
        group "tomcat"
        mode "0755"
        action :create
        not_if "test -d #{node[:tomcat][:basedir]}/server9002/webapps"
      end
      
      link "#{node[:tomcat][:basedir]}/server9002/webapps/adminapp"  do
        to "#{deploy_dir}/webapps-#{version}/adminapp"
        only_if "test -d #{deploy_dir}/webapps-#{version}"
      end
      
      template "#{node[:tomcat][:basedir]}/server9002/conf/Catalina/localhost/adminapp.xml" do
        source "mom/adminapp.xml.erb"
        mode 0644
        owner "sysadmin"
        group "sysadmin"
        variables(
          :mom_dbuser => mom_dbuser,
          :mom_dbpass => mom_dbpass,
          :mom_dbhost => mom_dbhost,
          :mom_dbname => mom_dbname
        )
        only_if "test -d #{node[:tomcat][:basedir]}/server9002/conf/Catalina/localhost"
      end
      
    end
    
  end
  
end 
