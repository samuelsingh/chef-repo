#
# Cookbook Name:: map_deployable
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

cookbook_file "/usr/local/sbin/install-build" do
  source "install-build"
  mode 0755
end

environment_id = "#{node[:fabric_deployment][:environment]}"
package_base = "#{node[:fabric_deployment][:env_package_dir]}"
env_packages = "#{environment_id}/#{package_base}"
hostname = "#{node[:hostname]}"

current_package_file = "#{env_packages}/current-version.txt"
deployed_here_file = "#{env_packages}/deployed-#{hostname}.txt"
database_schema_file = "#{env_packages}/db-schema-version.txt"

ruby_block "package_versions" do

  # Which package is currently deployed?
  if FileTest.exists?(deployed_here_file)
	  deployed_package = File.open(deployed_here_file, "r").gets.first.chomp
  else
	  deployed_package = nil
  end

  # Which package should be deployed?
  if FileTest.exists?(current_package_file)
	  current_package = File.open(current_package_file, "r").gets.first.chomp
  else
	  current_package = nil
  end

  # Which package is the database schema set to?
  if FileTest.exists?(database_schema_file)
	  db_schema_version = File.open(database_schema_file, "r").gets.first.chomp
  else
	  db_schema_version = nil
  end

  if deployed_package == current_package && deployed_package == db_schema_version
	# Everything is fine
	Chef::log.debug("Package #{deployed_package} is deployed and current on #{hostname}.")
	Chef::log.warn("Should implement something to ensure tomcat is running")
  else
	
	Chef::log.info("Deployment actions are needed on #{hostname}\ndeployed_package = #{deployed_package}\ncurrent_package = #{current_package}\ndb_schema_version = #{db_schema_version}")
	Chef::log.warn("STOP TOMCAT")

	if deployed_package != current_package
		Chef::log.info("App server #{hostname} has package #{deployed_package} deployed, needs to install #{current_package}")
		Chef::log.warn("REPLACE #{deployed_package} WITH #{current_package}")
	end

	if deployed_package != db_schema_version
		Chef::log.warn("App server #{hostname} has package #{deployed_package} deployed, database schema is for package #{db_schema_version}")
	end

	if current_package != db_schema_version
		Chef::log.warn("Database needs to be upgraded or rolled back to match package #{current_package}")
	end

  end


end

