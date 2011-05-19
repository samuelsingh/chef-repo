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

# User / group that Tomcat runs under
t_user = node[:tomcat][:user]
t_group = node[:tomcat][:group]

# User that a sysadmin uses to interact with the application
sys_usr = node[:mms][:common][:interactive_usr]

## First, let's  create the MMS base directory structure.  This looks something like:
#
# mms_base
# |- content-in
# |- content-out
# |- logs
# |- mapmanager
# |- mom
# |- previewloader
#
# cs-tools and queue-manager are dealt with in separate recipes

mms_base            = node[:mms][:common][:base]
content_in          = "#{mms_base}/content-in"
content_out         = "#{mms_base}/content-out"
log_base            = "#{mms_base}/logs"
mapmanager_base     = "#{mms_base}/mapmanager"
mom_base            = "#{mms_base}/mom"
previewloader_base  = "#{mms_base}/previewloader"

base_dirs = [mms_base,content_in,content_out,mapmanager_base,mom_base,previewloader_base]

base_dirs.each do |dir|
  
  directory dir do
    owner t_user
    group t_group
    action :create
  end

end

## Now we'll populate these base directories

## This is the structure for content-in which is used to import synchronisation packages into MMS
## Looks like:
#
# mms_base
# |- content-in
#   |- import
#   |- scheduled

directory "#{content_in}/scheduled"  do
  owner t_user
  group t_group
  action :create
end

directory "#{content_in}/import"  do
  owner sys_usr
  action :create
end

## This is the structure for content-out which is where published content shows up
## Looks like:
#
# mms_base
# |- content-out
#   |- md-packages
#   |- sync-packages

["#{content_out}/md-packages","#{content_out}/sync-packages"].each do |dir|
  
  directory dir do
    owner t_user
    group t_group
    action :create
  end
  
end

## This is the structure for content-out which is where published content shows up
## Looks like:
#
# mms_base
# |- logs
#   |- < dir for each webapp >

directory log_base do
  owner t_user
  group t_group
  action :create
end

## This is the structure required for the mapmanager webapp:
#
# mms_base
# |- mapmanager
#   |- logs
#   |- repo
#     |- repository.xml
#     |- indexing_configuration.xml

repo_home = "#{mapmanager_base}/repo"

directory "#{mapmanager_base}/logs" do
  owner t_user
  group t_group
  action :create
end

directory repo_home do
  owner t_user
  group t_group
  action :create
end

# For Client MMS, there needs to be an EBS volume to handle the workspace indexes,
# as they take so long to construct.  So if one is found where expected, mount it.

mount repo_home do
  device "/dev/sdh1"
  fstype "ext3"
  action [:mount, :enable]
  only_if "test -b /dev/sdh1"
  # TODO: trigger a chown of repo_home to the Tomcat user if a mount happens
end

template "#{repo_home}/repository.xml" do
  source "mapmanager/repository.xml.erb"
  mode 0644
  owner t_user
  group t_group
  variables(
    :repo_home => repo_home,
    :dbuser => node[:mms][:application][:repository][:dbuser],
    :dbpass => node[:mms][:application][:repository][:dbpass],
    :dbhost => node[:mms][:application][:repository][:dbhost],
    :dbname => node[:mms][:application][:repository][:dbname],
    :datastore => node[:mms][:application][:datastore]
  )
end

remote_file "#{repo_home}/indexing_configuration.xml" do
  source "mapmanager/indexing_configuration.xml"
  mode "0644"
end

# End: mapmanager

## This is the structure required for the mom webapp:
#
# mms_base
# |- mom
#   |- athens
#   |- index
#   |- ipgIndex
#   |- logs
#   |- nelhIndex
#   |- ssl
#   |- thesaurusindex
#   |- translation
#
# The mom webapp here is used by full map preview (FMP)

# Create empty directories, which are then populated dynamically by the application

[mom_base,"#{mom_base}/index","#{mom_base}/ipgIndex","#{mom_base}/nelhIndex","#{mom_base}/logs"].each do |dir|
  
  directory dir do
    owner t_user
    group t_group
    action :create
  end
  
end

# These directories contain static files, so are constructed from the recipe

['athens','ssl','thesaurusindex','translation'].each do |sdir|
  
  remote_directory "#{mom_base}/#{sdir}" do
    source "#{sdir}"
    files_mode "0644"
    mode "0755"
  end
  
end

# End: mom webapp

## This is the structure required for the previewloader webapp:
#
# mms_base
# |- previewloader
#   |- attachments
#   |- failure
#   |- input
#   |- logs
#   |- success
#   |- tmp
#

# Create empty directories, which are then populated dynamically by the application

preview_dirs = Array.new
preview_dirs << previewloader_base
preview_dirs << "#{previewloader_base}/attachments"
preview_dirs << "#{previewloader_base}/failure"
preview_dirs << "#{previewloader_base}/input"
preview_dirs << "#{previewloader_base}/logs"
preview_dirs << "#{previewloader_base}/success"
preview_dirs << "#{previewloader_base}/tmp"

preview_dirs.each do |dir|
  
  directory dir do
    owner t_user
    group t_group
    action :create
  end
  
end

# End: previewloader webapp

## Tomcat configuration

# As deployed in production, the mapmanager webapp is deployed to tomcat9001 while adminapp, mom and previewloader
# are on tomcat9002.  This allows the two tomcat processes to be controlled independently; useful when the previewloader
# fails (again).

if defined?(node[:tomcat][:ajp_ports]) && defined?(node[:tomcat][:basedir])
  
  node[:tomcat][:ajp_ports].each do |ajp_port|
    
    if ajp_port == 9001
      
      server_dir = "#{node[:tomcat][:basedir]}/server#{ajp_port}"
      shared_loader = "#{server_dir}/shared/lib"
      
      directory "#{server_dir}/webapps" do
        owner t_user
        group t_group
        action :create
      end
      
      ## Start: configuration for the mapmanager webapp
      
      deployment_name = node[:mms][:application][:deployment_name]
      athens_link     = node[:mms][:application][:athens_link]
      multiple_views  = node[:mms][:application][:multiple_views]
      
      template "#{server_dir}/conf/Catalina/localhost/mapmanager.xml" do
        source "mapmanager/mapmanager.xml.erb"
        mode 0644
        variables(
          :dbuser => node[:mms][:application][:mapmanager][:dbuser],
          :dbpass => node[:mms][:application][:mapmanager][:dbpass],
          :dbhost => node[:mms][:application][:mapmanager][:dbhost],
          :dbname => node[:mms][:application][:mapmanager][:dbname]
        )
        only_if "test -d #{server_dir}/conf/Catalina/localhost"
      end
      
      # Routine to figure out preview time values
      previewvals = /[0]{0,1}([1|2|3|4|5|6|7|8|9]{0,1}\d):[0]{0,1}([1|2|3|4|5|6|7|8|9]{0,1}\d)/.match("#{node[:mms][:application][:preview_time]}")
      
      template "#{shared_loader}/m2mr2-cs-base.properties" do
        source "mapmanager/m2mr2-cs-base.properties.erb"
        mode 0644
        variables(
          :mapmanager_base => mapmanager_base,
          :repo_home => repo_home,
          :content_out => content_out,
          :previewloader_base => previewloader_base,
          :deployment_name => deployment_name,
          :previewhour => previewvals[1],
          :previewmin => previewvals[2]
        )
      end
      
      template "#{shared_loader}/mapmanager.properties" do
        source "mapmanager/mapmanager.properties.erb"
        mode 0644
        variables(
          :mapmanager_base => mapmanager_base,
          :athens_link => athens_link,
          :multiple_views => multiple_views
        )
      end
      
      template "#{shared_loader}/mapmanager-log4j.xml" do
        source "mapmanager/mapmanager-log4j.xml.erb"
        mode 0644
        variables(
          :mapmanager_base => mapmanager_base
        )
      end
      
      # MapEditorCentralConfig.xml eliminated
      # cs-webservice.properties eliminated
      
      ## End: configuration for the mapmanager webapp
      
    end
    
    if ajp_port == 9002
      
      server_dir = "#{node[:tomcat][:basedir]}/server#{ajp_port}"
      shared_loader = "#{server_dir}/shared/lib"
      
      directory "#{server_dir}/webapps" do
        owner t_user
        group t_group
        action :create
      end
      
      ## Start: configuration for the mom webapp
      
      template "#{server_dir}/conf/Catalina/localhost/mom.xml" do
        source "mom/mom.xml.erb"
        mode 0644
        variables(
          :dbuser => node[:mms][:application][:mom][:dbuser],
          :dbpass => node[:mms][:application][:mom][:dbpass],
          :dbhost => node[:mms][:application][:mom][:dbhost],
          :dbname => node[:mms][:application][:mom][:dbname]
        )
        only_if "test -d #{server_dir}/conf/Catalina/localhost"
      end
      
      template "#{shared_loader}/mom-log4j.xml" do
        source "mom/mom-log4j.xml.erb"
        mode 0644
        variables(
          :mom_base => mom_base
        )
      end
      
      ## End: configuration for the mom webapp
      
      ## Start: configuration for the adminapp webapp
      
      template "#{server_dir}/conf/Catalina/localhost/adminapp.xml" do
        source "mom/adminapp.xml.erb"
        mode 0644
        variables(
          :dbuser => node[:mms][:application][:mapmanager][:dbuser],
          :dbpass => node[:mms][:application][:mapmanager][:dbpass],
          :dbhost => node[:mms][:application][:mapmanager][:dbhost],
          :dbname => node[:mms][:application][:mapmanager][:dbname]
        )
        only_if "test -d #{server_dir}/conf/Catalina/localhost"
      end

      template "#{shared_loader}/adminapp-log4j.xml" do
        source "mom/adminapp-log4j.xml.erb"
        mode 0644
        variables(
          :mom_base => mom_base
        )
      end
      
      ## End: configuration for the adminapp webapp
      
      ## Start: configuration for the previewloader webapp
      
      template "#{shared_loader}/previewloader-log4j.properties" do
        source "previewloader/previewloader-log4j.properties.erb"
        mode 0644
        variables(
          :previewloader_base => previewloader_base
        )
      end
      
      template "#{server_dir}/conf/Catalina/localhost/previewloader.xml" do
        source "previewloader/previewloader.xml.erb"
        mode 0644
        variables(
          :dbuser => node[:mms][:application][:mom][:dbuser],
          :dbpass => node[:mms][:application][:mom][:dbpass],
          :dbhost => node[:mms][:application][:mom][:dbhost],
          :dbname => node[:mms][:application][:mom][:dbname]
        )
        only_if "test -d #{server_dir}/conf/Catalina/localhost"
      end
      
      template "#{shared_loader}/contentloader.properties" do
        source "previewloader/contentloader.properties.erb"
        mode 0644
        variables(
          :previewpath => previewloader_base,
          :mom_dbuser => node[:mms][:application][:mom][:dbuser],
          :mom_dbpass => node[:mms][:application][:mom][:dbpass],
          :mom_dbhost => node[:mms][:application][:mom][:dbhost],
          :mom_dbname => node[:mms][:application][:mom][:dbname]
        )
        only_if "test -d #{shared_loader}"
      end
      
      ## End: configuration for the previewloader webapp
      
    end
    
    # mom.properties is required by all webapps
    template "#{shared_loader}/mom.properties" do
      source "mom/mom.properties.erb"
      mode 0644
      variables(
        :mom_base => mom_base
      )
    end
    
  end
  
end
