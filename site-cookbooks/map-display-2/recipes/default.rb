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
webapp_dir = node[:map_display][:webapp_dir]
md_version = node[:map_display][:version]

dbuser = node[:map_display][:dbuser]
dbpass = node[:map_display][:dbpass]
dbhost = node[:map_display][:dbhost]
dbname = node[:map_display][:dbname]

t_user = node[:tomcat][:user]
t_group = node[:tomcat][:group]

# Dynamic directories, used by Tomcat
#
directory "#{mtmpath}"  do
  owner t_user
  group t_group
  mode "0755"
  recursive true
  action :create
  not_if "test -d #{mtmpath}"
end

directory "#{mtmpath}/index"  do
  owner t_user
  group t_group
  mode "0755"
  action :create
  not_if "test -d #{mtmpath}/index"
end

directory "#{mtmpath}/logs"  do
  owner t_user
  group t_group
  mode "0755"
  action :create
  not_if "test -d #{mtmpath}/logs"
end

directory "#{mtmpath}/ipgIndex"  do
  owner t_user
  group t_group
  mode "0755"
  action :create
  not_if "test -d #{mtmpath}/ipgIndex"
end

directory "#{mtmpath}/nelhIndex"  do
  owner t_user
  group t_group
  mode "0755"
  action :create
  not_if "test -d #{mtmpath}/nelhIndex"
end

# Static directories
#

remote_directory "#{mtmpath}/athens" do
  source "athens"
  files_group t_user
  files_group t_group
  files_mode "0644"
  group t_user
  group t_group
  mode "0755"
end

remote_directory "#{mtmpath}/ssl" do
  source "ssl"
  files_group t_user
  files_group t_group
  files_mode "0644"
  group t_user
  group t_group
  mode "0755"
end

remote_directory "#{mtmpath}/thesaurusindex" do
  source "thesaurusindex"
  files_group t_user
  files_group t_group
  files_mode "0644"
  group t_user
  group t_group
  mode "0755"
end

remote_directory "#{mtmpath}/translation" do
  source "translation"
  files_group t_user
  files_group t_group
  files_mode "0644"
  group t_user
  group t_group
  mode "0755"
end

if defined?(node[:tomcat][:ajp_ports]) && defined?(node[:tomcat][:basedir])
  
  node[:tomcat][:ajp_ports].each do |ajp_port|
    
    if ajp_port == 9001
      
      server_dir = "#{node[:tomcat][:basedir]}/server#{ajp_port}"
      shared_loader = "#{server_dir}/shared/lib"
      
      directory "#{server_dir}/webapps" do
        owner t_user
        group t_group
        mode "0755"
        action :create
        not_if "test -d #{server_dir}/webapps"
      end
      
      template "#{server_dir}/conf/Catalina/localhost/mom.xml" do
        source "mom.xml.erb"
        mode 0644
        group t_user
        group t_group
        variables(
          :dbuser => dbuser,
          :dbpass => dbpass,  
          :dbhost => dbhost,
          :dbname => dbname
        )
        only_if "test -d #{server_dir}/conf/Catalina/localhost"
      end
      
      if (node[:map_display][:save_ram] == "true" || node[:ec2][:instance_type] == "m1.small")
      
        template "#{server_dir}/etc/java_opts.conf" do
          source "etc/java_opts.conf.erb"
          mode 0644
          group t_user
          group t_group
          variables(
            :start_memory => "512m",
            :max_memory => "950m"
          )
          only_if "test -d #{server_dir}/etc"
        end
        
      end
      
      template "#{shared_loader}/mom-log4j.xml" do
        source "mom-log4j.xml.erb"
        mode 0644
        group t_user
        group t_group
        variables(
          :mtmpath => mtmpath,
          :md_fqdn => md_fqdn
        )
      end
      
      template "#{shared_loader}/mom.properties" do
        source "mom.properties.erb"
        mode 0644
        group t_user
        group t_group
        variables(
          :mtmpath => mtmpath,
          :md_fqdn => md_fqdn
        )
      end
      
    end
    
    if ajp_port == 9002
      
      server_dir = "#{node[:tomcat][:basedir]}/server#{ajp_port}"
      shared_loader = "#{server_dir}/shared/lib"
      
      
      directory "#{server_dir}/webapps" do
        owner t_user
        group t_group
        mode "0755"
        action :create
        not_if "test -d #{server_dir}/webapps"
      end
      
      template "#{server_dir}/conf/Catalina/localhost/adminapp.xml" do
        source "adminapp.xml.erb"
        mode 0644
        group t_user
        group t_group
        variables(
          :dbuser => dbuser,
          :dbpass => dbpass,
          :dbhost => dbhost,
          :dbname => dbname
        )
        only_if "test -d #{server_dir}/conf/Catalina/localhost"
      end
      
      if (node[:map_display][:save_ram] == "true" || node[:ec2][:instance_type] == "m1.small")
      
        template "#{server_dir}/etc/java_opts.conf" do
          source "etc/java_opts.conf.erb"
          mode 0644
          group t_user
          group t_group
          variables(
            :start_memory => "256m",
            :max_memory => "450m"
          )
          only_if "test -d #{server_dir}/etc"
        end
        
      end
      
      template "#{shared_loader}/adminapp-log4j.xml" do
        source "adminapp-log4j.xml.erb"
        mode 0644
        group t_user
        group t_group
        variables(
          :mtmpath => mtmpath,
          :md_fqdn => md_fqdn
        )
      end
      
      template "#{shared_loader}/adminapp.properties" do
        source "adminapp.properties.erb"
        mode 0644
        group t_user
        group t_group
        variables(
          :mtmpath => mtmpath,
          :md_fqdn => md_fqdn
        )
      end
      
    end
    
  end
  
end 
