#
# Cookbook Name:: s3sync
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

# Installs SSL certificates, used for signing the S3 connection
package "ca-certificates" do
  action :install
end

ssl_cert_dir = "/etc/ssl/certs"

remote_directory "/usr/local/s3sync" do
  source "s3sync"
  files_backup 5
  files_owner "root"
  files_group "root"
  files_mode "0755"
  owner "root"
  group "root"
  mode "0755"
end

directory "/etc/s3conf" do
  owner "root"
  group "root"
  mode "0755"
end

template "/etc/s3conf/s3config.yml" do
  source "s3config.yml.erb"
  owner "root"
  group "root"
  mode "0600"
  variables(
    :aws_access_key_id => node[:ec2][:ec2_access_key],
    :aws_secret_access_key => node[:ec2][:ec2_secret_key],
    :ssl_cert_dir => ssl_cert_dir,
    :aws_calling_format => node[:s3sync][:aws_calling_format]
  )
end
