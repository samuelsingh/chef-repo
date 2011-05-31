#
# Cookbook Name:: sudo
# Recipe:: default
#
# Copyright 2008-2009, Opscode, Inc.
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

log node.run_state.inspect
log node.run_list.run_list.flatten.member?("hg-mde::content_source").inspect
node.run_state[:seen_recipes].has_key?("hg-mde::content_source") ? content_source = true : content_source = false

package "sudo" do
  action :upgrade
end

template "/etc/sudoers" do
  source "sudoers.erb"
  mode 0440
  owner "root"
  group "root"
  variables(
    :sudoers_groups => node[:authorization][:sudo][:groups], 
    :sudoers_users => node[:authorization][:sudo][:users],
    :content_source => content_source
  )
end
