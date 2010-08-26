#
# Cookbook Name:: awstats
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

log_base = "/var/shared/logs"

package "awstats" do
  case node[:platform]
  when "debian","ubuntu"
    package_name "awstats"
  end
  action :install
end

node[:awstats].each do |vhost,params|
  
  template "/etc/awstats/awstats.#{vhost}.conf" do
    source "awstats.conf.template.erb"
    mode 0644
    owner "sysadmin"
    group "sysadmin"
    variables(
      :vhost => vhost,
      :host_regex => params.fetch("host_regex"),
      :log_base => log_base
    )
    only_if "test -d /etc/awstats"
  end

end