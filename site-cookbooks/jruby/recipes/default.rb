#
# Cookbook Name:: jruby
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

include_recipe "java"

jruby_v = "1.5.3"

# Deploy Jruby binaries
execute "deploy_jruby" do
  command "cd /usr/local && tar xzf /var/tmp/jruby-bin-#{jruby_v}.tar.gz"
  action :nothing
end

# Grab Jruby binaries
remote_file "/var/tmp/jruby-bin-#{jruby_v}.tar.gz" do
  source "jruby-bin-#{jruby_v}.tar.gz"
  backup false
  mode "0644"
  notifies :run, resources(:execute => "deploy_jruby"), :immediately
  not_if "test -f /usr/local/jruby-#{jruby_v}/LICENSE.RUBY"
end

# Delete Jruby binary package if it's been deployed
file "/var/tmp/jruby-bin-#{jruby_v}.tar.gz" do
  action :delete
  only_if "test -f /usr/local/jruby-#{jruby_v}/LICENSE.RUBY"
end

link "/usr/local/jruby-latest"  do
  to "/usr/local/jruby-#{jruby_v}"
  only_if "/usr/local/jruby-#{jruby_v}"
end

template "/etc/profile.d/jruby.sh" do
  source "jruby.sh.erb"
  mode "0644"
end

