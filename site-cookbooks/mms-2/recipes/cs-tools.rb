#
# Cookbook Name:: mms-2
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

mms_base            = node[:mms][:common][:base]
content_out         = "#{mms_base}/content-out"
cstools_base        = "#{mms_base}/cs-tools"
log_base            = "#{mms_base}/logs"
mapmanager_base     = "#{mms_base}/mapmanager"
mom_base            = "#{mms_base}/mom"
previewloader_base  = "#{mms_base}/previewloader"

dist_dir    = "#{mms_base}/dist"
dist_zip    = "cs-tools.zip"

t_user = node[:tomcat][:user]
t_group = node[:tomcat][:group]

repo_home = "#{mapmanager_base}/repo"

## The below is a generic routine to deploy a zipfile. It does this by comparing an md5sum of the archive,
## with the one stored, and re-deploys if the two don't match

# Zipfiles placed here will be deployed by the next chef run
directory "#{dist_dir}" do
  action :create
  recursive true
  not_if "test -d #{dist_dir}"
end

if File.exists?("#{dist_dir}/#{dist_zip}")
  
  execute "deploy_dist" do
    command "rm -rf #{cstools_base} && unzip #{dist_dir}/#{dist_zip} -d #{cstools_base} && chmod 755 #{cstools_base}/*.sh"
    action :nothing
  end
  
  # Checksum the contentloader
  execute "checksum_contentloader" do
    command "md5sum #{dist_dir}/#{dist_zip} > #{dist_dir}/#{dist_zip}.md5"
    notifies :run, resources(:execute => "deploy_dist"), :immediately
    not_if "md5sum -c --status #{dist_dir}/#{dist_zip}.md5 > /dev/null"
  end
  
end

remote_file "#{cstools_base}/cs-tools" do
  source "cs-tools/cs-tools.sh"
  mode "0755"
  only_if "test -d #{cstools_base}"
end

directory "#{log_base}/cs-tools"  do
  owner t_user
  group t_group
  mode "0755"
  recursive true
  action :create
end

# cs-tools doesn't actually use values from this, but just requires these values as placeholders
template "#{cstools_base}/config/mom.properties" do
  source "mom/mom.properties.erb"
  mode 0644
  variables(
    :mompath => "/tmp",
    :fqdn => "unset"
  )
  only_if "test -d #{cstools_base}/config"
end

template "#{cstools_base}/config/m2mr2-cs-deployment.properties" do
  source "cs-tools/m2mr2-cs-deployment.properties.erb"
  mode 0644
  only_if "test -d #{cstools_base}/config"
end

template "#{cstools_base}/config/repository.properties" do
  source "cs-tools/repository.properties.erb"
  mode 0644
  variables(
    :mapmanager_base => mapmanager_base
  )
  only_if "test -d #{cstools_base}/config"
end

template "#{cstools_base}/config/m2mr2-cs-base.properties" do
  source "mapmanager/m2mr2-cs-base.properties.erb"
  mode 0644
  variables(
    :mapmanager_base => mapmanager_base,
    :repo_home => repo_home,
    :content_out => content_out,
    :previewloader_base => previewloader_base,
    :deployment_name => 'cs-tools',
    :previewhour => '1',
    :previewmin => '1'
  )
  only_if "test -d #{cstools_base}/config"
end

remote_file "#{cstools_base}/config/auto-approve.properties" do
  source "cs-tools/config/auto-approve.properties"
  mode 0644
  only_if "test -d #{cstools_base}/config"
end

template "#{cstools_base}/config/log4j.xml" do
  source "cs-tools/log4j.xml.erb"
  mode 0644
  variables(
    :log_base => log_base
  )
  only_if "test -d #{cstools_base}/config"
end

template "/etc/profile.d/mms-cstools.sh" do
  source "etc/profile.d/mms-cstools.sh.erb"
  mode 0755
  variables(
    :cstools_base => cstools_base
  )
end

remote_file "#{cstools_base}/config/m2mr2-cs-spring.properties" do
  source "cs-tools/config/m2mr2-cs-spring.properties"
  mode 0644
  only_if "test -d #{cstools_base}/config"
end