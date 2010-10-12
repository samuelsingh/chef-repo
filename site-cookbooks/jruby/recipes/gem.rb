#
# Cookbook Name:: jruby
# Recipe:: gem
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

include_recipe "jruby"

jruby_gems = node[:jruby][:gems]
jruby_home = "/usr/local/jruby-latest"


jruby_gems.each do |gem|
  
  execute "jgem install" do
    command "#{jruby_home}/bin/jruby -S gem install #{gem}"
    not_if "test -d #{jruby_home}/lib/ruby/gems/1.8/gems/#{gem}*"
  end
  
end

