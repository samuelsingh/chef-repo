#
# Cookbook Name:: mms-2
# Recipe:: cs-batch
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

include_recipe "mms-2::application"

mms_base     = node[:mms][:common][:base]
content_in   = "#{mms_base}/content-in"
csbatch_base = "#{mms_base}/cs-batch"
log_path     = "#{mms_base}/logs/cs-batch"
dist_dir     = "#{mms_base}/dist"
dist_zip    = "cs-batch.zip"

# User that a sysadmin uses to interact with the application
sys_usr = node[:mms][:common][:interactive_usr]

## This is the structure for content-in which is used to import synchronisation packages into MMS
## Looks like:
#
# mms_base
# |- content-in
#   |- import
#   |- scheduled
# |- cs-batch

directory "#{content_in}/scheduled"  do
  owner sys_usr
  action :create
  recursive true
end

directory "#{content_in}/import"  do
  owner sys_usr
  action :create
end

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
    command "rm -rf #{csbatch_base} && unzip #{dist_dir}/#{dist_zip} -d #{csbatch_base} && chmod 755 #{csbatch_base}/*.sh"
    action :nothing
  end
  
  # Checksum the contentloader
  execute "checksum_contentloader" do
    command "md5sum #{dist_dir}/#{dist_zip} > #{dist_dir}/#{dist_zip}.md5"
    notifies :run, resources(:execute => "deploy_dist"), :immediately
    not_if "md5sum -c --status #{dist_dir}/#{dist_zip}.md5 > /dev/null"
  end
  
end

remote_file "#{csbatch_base}/cs-batch.sh" do
  source "cs-batch/cs-batch.sh"
  mode "0755"
  only_if "test -d #{csbatch_base}"
end

directory "#{log_path}/cs-batch"  do
  owner sys_usr
  mode "0755"
  recursive true
  action :create
  only_if "test -d #{log_path}"
end

template "#{csbatch_base}/config/m2mr2-batch.properties" do
  source "cs-batch/m2mr2-batch.properties.erb"
  mode 0644
  variables(
    :content_in => content_in
  )
  only_if "test -d #{csbatch_base}"
end

template "#{csbatch_base}/config/log4j.xml" do
  source "cs-batch/log4j.xml.erb"
  mode 0644
  variables(
    :logpath => log_path
  )
  only_if "test -d #{csbatch_base}"
end

template "#{csbatch_base}/config/cs-batch.conf" do
  source "cs-batch/cs-batch.conf.erb"
  mode 0644
  variables(
    :sys_usr => sys_usr
  )
  only_if "test -d #{csbatch_base}"
end

template "/etc/profile.d/mms-cs-batch.sh" do
  source "etc/profile.d/mms-cs-batch.sh.erb"
  mode 0755
  variables(
    :csbatch_path => csbatch_base
  )
end