#
# Cookbook Name:: map-display
# Recipe:: time-transactions
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

tt_path = "/usr/local/time-transactions"
archive_dir = "/var/shared/archive/stats/transactions"
md_fqdn = node[:map_display][:md_fqdn]

package "libxml-simple-perl" do
  action :install
end

package "libcrypt-ssleay-perl" do
  action :install
end

package "liberror-perl" do
  action :install
end

directory "#{tt_path}/webinject"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  action :create
  recursive true
  not_if "test -d #{tt_path}/webinject"
end

directory "#{archive_dir}"  do
  owner "sysadmin"
  group "sysadmin"
  mode "0755"
  action :create
  recursive true
  not_if "test -d #{archive_dir}"
end

webinject_pls = ["webinject.pl", "webinject-parser"]

webinject_pls.each do |pl|

  template "#{tt_path}/webinject/#{pl}" do
    source "time-transactions/#{pl}.erb"
    mode 0755
    owner "root"
    group "root"
  end

end

webinject_files = ["config.xml", "mycert.pem", "mycertkey.pem"]

webinject_files.each do |name|

  template "#{tt_path}/webinject/#{name}" do
    source "time-transactions/#{name}.erb"
    mode 0644
    owner "sysadmin"
    group "sysadmin"
  end

end

template "#{tt_path}/webinject/transactions.xml" do
  source "time-transactions/transactions.xml.erb"
  mode 0644
  owner "sysadmin"
  group "sysadmin"
  variables(
    :md_fqdn => md_fqdn
  )
end

template "#{tt_path}/time-transactions.sh" do
  source "time-transactions/time-transactions.sh.erb"
  mode 0755
  owner "root"
  group "root"
  variables(
    :archive_dir => archive_dir,
    :tt_path => tt_path
  )
end

template "/etc/cron.d/test-transactions" do
  source "time-transactions/test-transactions.erb"
  mode 0644
  owner "root"
  group "root"
  variables(
    :tt_path => tt_path
  )
end