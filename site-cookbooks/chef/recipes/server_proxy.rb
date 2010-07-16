#
# Author:: Joshua Timberman <joshua@opscode.com>
# Cookbook Name:: chef
# Recipe:: server_proxy
#
# Copyright 2009, Opscode, Inc
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

chef_srv = search(:node, "chef_webui_enabled:true").first

root_group = value_for_platform(
  "openbsd" => { "default" => "wheel" },
  "freebsd" => { "default" => "wheel" },
  "default" => "root"
)

node[:apache][:listen_ports] << "443" unless node[:apache][:listen_ports].include?("443")
if node[:chef][:webui_enabled]
  node[:apache][:listen_ports] << "444" unless node[:apache][:listen_ports].include?("444")
end

include_recipe "apache2"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_proxy"
include_recipe "apache2::mod_proxy_http"
include_recipe "apache2::mod_proxy_balancer"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_headers"
include_recipe "apache2::mod_expires"
include_recipe "apache2::mod_deflate"

directory "/etc/chef/certificates" do
  owner "root"
  group root_group
  mode "700"
  recursive true
end

bash "Create SSL Certificates" do
  cwd "/etc/chef/certificates"
  code <<-EOH
  umask 077
  openssl genrsa 2048 > #{node[:chef_proxy][:fqdn]}.key
  openssl req -subj "#{node[:chef_proxy][:server_ssl_req]}" -new -x509 -nodes -sha1 -days 3650 -key #{node[:chef_proxy][:fqdn]}.key > #{node[:chef_proxy][:fqdn]}.crt
  cat #{node[:chef_proxy][:fqdn]}.key #{node[:chef_proxy][:fqdn]}.crt > #{node[:chef_proxy][:fqdn]}.pem
  EOH
  not_if { File.exists?("/etc/chef/certificates/#{node[:chef_proxy][:fqdn]}.pem") }
end

web_app "chef_server" do
  template "chef_server.conf.erb"
  server_name node[:chef_proxy][:fqdn]
  api_proxy = node[:chef_proxy][:api_fqdn]
  chef_server = chef_srv["fqdn"]
  server_port = chef_srv["chef"]["server_port"]
  webui_port = chef_srv["chef"]["webui_port"]
  server_aliases = Array.new
  log_dir node[:apache][:log_dir]
end
