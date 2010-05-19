#
# Cookbook Name:: map-display
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
mtmpath = node[:map_display][:mtmpath]
md_fqdn = node[:map_display][:md_fqdn]
deploy_dir = node[:map_display][:deploy_dir]
md_version = node[:map_display][:version]

dbuser = node[:map_display][:dbuser]
dbpass = node[:map_display][:dbpass]
dbhost = node[:map_display][:dbhost]
dbname = node[:map_display][:dbname]

# Dynamic directories, used by Tomcat
#
directory "#{mtmpath}"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{mtmpath}"
end

directory "#{mtmpath}/index"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  action :create
  not_if "test -d #{mtmpath}/index"
end

directory "#{mtmpath}/logs"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  action :create
  not_if "test -d #{mtmpath}/logs"
end

directory "#{mtmpath}/ipgIndex"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  action :create
  not_if "test -d #{mtmpath}/ipgIndex"
end

directory "#{mtmpath}/nelhIndex"  do
  owner "tomcat"
  group "tomcat"
  mode "0755"
  action :create
  not_if "test -d #{mtmpath}/nelhIndex"
end

# Static directories
#

remote_directory "#{mtmpath}/athens" do
  source "athens"
  files_owner "sysadmin"
  files_group "sysadmin"
  files_mode "0644"
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
end

remote_directory "#{mtmpath}/ssl" do
  source "ssl"
  files_owner "sysadmin"
  files_group "sysadmin"
  files_mode "0644"
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
end

remote_directory "#{mtmpath}/thesaurusindex" do
  source "thesaurusindex"
  files_owner "sysadmin"
  files_group "sysadmin"
  files_mode "0644"
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
end

remote_directory "#{mtmpath}/translation" do
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

directory "#{mtmpath}/config"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  action :create
  not_if "test -d #{mtmpath}/config"
end

template "#{mtmpath}/config/adminapp-log4j.xml" do
  source "adminapp-log4j.xml.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mtmpath => mtmpath,
    :md_fqdn => md_fqdn
  )
end

template "#{mtmpath}/config/adminapp.properties" do
  source "adminapp.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mtmpath => mtmpath,
    :md_fqdn => md_fqdn
  )
end

template "#{mtmpath}/config/mom-log4j.xml" do
  source "mom-log4j.xml.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mtmpath => mtmpath,
    :md_fqdn => md_fqdn
  )
end

template "#{mtmpath}/config/mom.properties" do
  source "mom.properties.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :mtmpath => mtmpath,
    :md_fqdn => md_fqdn
  )
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
        to "#{deploy_dir}/webapps-#{md_version}/mom"
      end
      
      template "#{node[:tomcat][:basedir]}/server9001/conf/Catalina/localhost/mom.xml" do
        source "mom.xml.erb"
        mode 0644
        owner "sysadmin"
        group "sysadmin"
        variables(
          :dbuser => dbuser,
          :dbpass => dbpass,
          :dbhost => dbhost,
          :dbname => dbname
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
        to "#{deploy_dir}/webapps-#{md_version}/adminapp"
      end
      
      template "#{node[:tomcat][:basedir]}/server9002/conf/Catalina/localhost/adminapp.xml" do
        source "adminapp.xml.erb"
        mode 0644
        owner "sysadmin"
        group "sysadmin"
        variables(
          :dbuser => dbuser,
          :dbpass => dbpass,
          :dbhost => dbhost,
          :dbname => dbname
        )
        only_if "test -d #{node[:tomcat][:basedir]}/server9002/conf/Catalina/localhost"
      end
      
    end
    
  end
  
end 