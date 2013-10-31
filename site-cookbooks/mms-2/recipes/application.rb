#
# Cookbook Name:: mms-2
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

# User / group that Tomcat runs under
t_user = node[:tomcat][:user]
t_group = node[:tomcat][:group]

# User that a sysadmin uses to interact with the application
sys_usr = node[:mms][:common][:interactive_usr]

## First, let's  create the MMS base directory structure.  This looks something like:
#
# mms_base
# |- content-out
# |- logs
# |- mapmanager
# |- mom
# |- previewloader
#
# cs-tools and queue-manager are dealt with in separate recipes

mms_base            = node[:mms][:common][:base]
content_out         = "#{mms_base}/content-out"
log_base            = "#{mms_base}/logs"
mapmanager_base     = "#{mms_base}/mapmanager"
mom_base            = "#{mms_base}/mom"
previewloader_base  = "#{mms_base}/previewloader"

base_dirs = [mms_base,content_out,mapmanager_base,mom_base,previewloader_base]

base_dirs.each do |dir|

  directory dir do
    owner t_user
    group t_group
    action :create
  end

end

## Now we'll populate these base directories

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

# Construct a log directory for each webapp
webapps = ['adminapp','mapmanager','mom','previewloader']

webapps.each do |app|

  directory "#{log_base}/#{app}" do
    owner t_user
    group t_group
    action :create
  end

end

## This is the structure required for the mapmanager webapp:
#
# mms_base
# |- mapmanager
#   |- repo
#     |- repository.xml
#     |- indexing_configuration.xml
#   |- ws
#     |- MapEditorCentralConfig.xml

repo_home = "#{mapmanager_base}/repo"
ws_home = "#{mapmanager_base}/ws"

directory repo_home do
  owner t_user
  group t_group
  action :create
end

directory ws_home do
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
    :repo_home  => repo_home,
    :dbuser     => node[:mms][:application][:repository][:dbuser],
    :dbpass     => node[:mms][:application][:repository][:dbpass],
    :dbhost     => node[:mms][:application][:repository][:dbhost],
    :dbname     => node[:mms][:application][:repository][:dbname],
    :datastore  => node[:mms][:application][:repository][:datastore]
  )
end

remote_file "#{repo_home}/indexing_configuration.xml" do
  source "mapmanager/indexing_configuration.xml"
  mode "0644"
end

# Used by the Map Editor webservice

template "#{ws_home}/MapEditorCentralConfig.xml" do
  source "mapmanager/MapEditorCentralConfig.xml.erb"
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
#   |- nelhIndex
#   |- ssl
#   |- thesaurusindex
#   |- translation
#
# The mom webapp here is used by full map preview (FMP)

# Create empty directories, which are then populated dynamically by the application

[mom_base,"#{mom_base}/index","#{mom_base}/ipgIndex","#{mom_base}/nelhIndex"].each do |dir|

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
#   |- success
#   |- tmp
#

# Create empty directories, which are then populated dynamically by the application

preview_dirs = Array.new
preview_dirs << previewloader_base
preview_dirs << "#{previewloader_base}/attachments"
preview_dirs << "#{previewloader_base}/failure"
preview_dirs << "#{previewloader_base}/input"
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
      common_loader = "#{server_dir}/common/classes"
      common_lib = "#{server_dir}/common/lib"

      directory "#{server_dir}/webapps" do
        owner t_user
        group t_group
        action :create
      end

      ## Start: configuration for the mapmanager webapp

      deployment_name = node[:mms][:application][:deployment][:name]
      athens_link     = node[:mms][:application][:athens_link]
      multiple_views  = node[:mms][:application][:multiple_views]

      template "#{server_dir}/conf/Catalina/localhost/mapmanager.xml" do
        source "mapmanager/mapmanager.xml.erb"
        mode 0644
        variables(
          :dbuser => node[:mms][:common][:dbuser],
          :dbpass => node[:mms][:common][:dbpass],
          :dbhost => node[:mms][:common][:dbhost],
          :dbname => node[:mms][:application][:mapmanager][:dbname]
        )
        only_if "test -d #{server_dir}/conf/Catalina/localhost"
      end

      # Routine to figure out preview time values
      previewvals = /[0]{0,1}([1|2|3|4|5|6|7|8|9]{0,1}\d):[0]{0,1}([1|2|3|4|5|6|7|8|9]{0,1}\d)/.match("#{node[:mms][:application][:preview_time]}")

      template "#{common_loader}/m2mr2-cs-base.properties" do
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

      template "#{common_loader}/mapmanager.properties" do
        source "mapmanager/mapmanager.properties.erb"
        mode 0644
        variables(
          :mapmanager_base => mapmanager_base,
          :athens_link => athens_link,
          :multiple_views => multiple_views
        )
      end

      template "#{common_loader}/mapmanager-log4j.xml" do
        source "mapmanager/mapmanager-log4j.xml.erb"
        mode 0644
        variables(
          :log_base => log_base
        )
      end

      template "#{common_loader}/cs-webservice.properties" do
        source "mapmanager/cs-webservice.properties.erb"
        variables(
          :mapmanager_base => mapmanager_base
        )
        mode "0644"
      end

      ## End: configuration for the mapmanager webapp

    end

    if ajp_port == 9002

      server_dir = "#{node[:tomcat][:basedir]}/server#{ajp_port}"
      common_loader = "#{server_dir}/common/classes"
      common_lib = "#{server_dir}/common/lib"

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
          :dbuser => node[:mms][:common][:dbuser],
          :dbpass => node[:mms][:common][:dbpass],
          :dbhost => node[:mms][:common][:dbhost],
          :dbname => node[:mms][:application][:mapmanager][:dbname]
        )
        only_if "test -d #{server_dir}/conf/Catalina/localhost"
      end

      template "#{common_loader}/mom-log4j.xml" do
        source "mom/mom-log4j.xml.erb"
        mode 0644
        variables(
          :log_base => log_base
        )
      end

      template "#{common_loader}/mom-previewloader.properties" do
        source "mom/mom-previewloader.properties.erb"
        mode 0644
      end

      ## End: configuration for the mom webapp

      ## Start: configuration for the adminapp webapp

      template "#{server_dir}/conf/Catalina/localhost/adminapp.xml" do
        source "mom/adminapp.xml.erb"
        mode 0644
        variables(
          :dbuser => node[:mms][:common][:dbuser],
          :dbpass => node[:mms][:common][:dbpass],
          :dbhost => node[:mms][:common][:dbhost],
          :dbname => node[:mms][:application][:mapmanager][:dbname]
        )
        only_if "test -d #{server_dir}/conf/Catalina/localhost"
      end

      template "#{common_loader}/adminapp-log4j.xml" do
        source "mom/adminapp-log4j.xml.erb"
        mode 0644
        variables(
          :log_base => log_base
        )
      end

      ## End: configuration for the adminapp webapp

      ## Start: configuration for the previewloader webapp##sss##chaning from [:mms][:application][:mom] to [:mms][:common]

      template "#{common_loader}/previewloader-log4j.properties" do
        source "previewloader/previewloader-log4j.properties.erb"
        mode 0644
        variables(
          :log_base => log_base
        )
      end

      template "#{server_dir}/conf/Catalina/localhost/previewloader.xml" do
        source "previewloader/previewloader.xml.erb"
        mode 0644
        variables(
          :dbuser => node[:mms][:common][:dbuser],
          :dbpass => node[:mms][:common][:dbpass],
          :dbhost => node[:mms][:common][:dbhost],
          :dbname => node[:mms][:application][:mom][:dbname]
        )
        only_if "test -d #{server_dir}/conf/Catalina/localhost"
      end

      template "#{common_loader}/contentloader.properties" do
        source "previewloader/contentloader.properties.erb"
        mode 0644
        variables(
          :previewpath => previewloader_base,
          :mom_dbuser => node[:mms][:common][:dbuser],
          :mom_dbpass => node[:mms][:common][:dbpass],
          :mom_dbhost => node[:mms][:common][:dbhost],
          :mom_dbname => node[:mms][:common][:dbname]
        )
        only_if "test -d #{common_loader}"
      end

      ## End: configuration for the previewloader webapp

    end

    # mom.properties is required by all webapps
    template "#{common_loader}/mom.properties" do
      source "mom/mom.properties-01.erb"
      mode 0644
      variables(
        :mom_base => mom_base
      )
    end

  end

end

