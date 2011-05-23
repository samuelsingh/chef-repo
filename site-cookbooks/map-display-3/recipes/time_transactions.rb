#
# Cookbook Name:: map-display-3
# Recipe:: time_transactions
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

tt_path = node[:map_display][:time_transactions][:base]
tt_user = node[:map_display][:time_transactions][:user]
tt_group = node[:map_display][:time_transactions][:group]

archive_dir = node[:map_display][:time_transactions][:archive_dir]
md_fqdn = node[:map_display][:application][:md_fqdn]

group "#{tt_group}"  do
  gid 10070
end

user "#{tt_user}"  do
  comment "Webinject user"
  uid "10070"
  gid tt_group
  home tt_path
  shell "/bin/bash"
end

package "libxml-simple-perl" do
  action :install
end

package "libcrypt-ssleay-perl" do
  action :install
end

package "liberror-perl" do
  action :install
end

directory tt_path  do
  owner tt_user
  group tt_group
  mode "0755"
  action :create
  recursive true
  not_if "test -d #{tt_path}"
end

directory "#{archive_dir}"  do
  owner tt_user
  group tt_group
  mode "0755"
  action :create
  recursive true
  not_if "test -d #{archive_dir}"
end

webinject_pls = ["webinject.pl", "webinject-parser"]

webinject_pls.each do |pl|

  template "#{tt_path}/#{pl}" do
    source "time-transactions/#{pl}.erb"
    mode 0755
  end

end

webinject_files = ["config.xml", "mycert.pem", "mycertkey.pem"]

webinject_files.each do |name|

  template "#{tt_path}/#{name}" do
    source "time-transactions/#{name}.erb"
    mode 0644
  end

end

template "#{tt_path}/transactions.xml" do
  source "time-transactions/transactions.xml.erb"
  mode 0644
  variables(
    :md_fqdn => md_fqdn
  )
end

template "#{tt_path}/time-transactions.sh" do
  source "time-transactions/time-transactions.sh.erb"
  mode 0755
  variables(
    :archive_dir => archive_dir,
    :tt_path => tt_path
  )
end

cron "time-transactions" do
  user tt_user
  minute '15,45'
  command "#{tt_path}/time-transactions.sh"
end
