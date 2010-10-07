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

remote_file "/usr/local/sbin/install-build" do
  source "install-build"
  mode 0755
end

environment_id = "#{node[:fabric_deployment][:environment]}"
package_base = "#{node[:fabric_deployment][:env_package_dir]}"
env_packages = "#{package_base}/#{environment_id}"
hostname = "#{node[:hostname]}"

current_package_file = "#{env_packages}/current-version.txt"
deployed_here_file = "#{env_packages}/deployed-#{hostname}.txt"
database_schema_file = "#{env_packages}/db-schema-version.txt"

ruby_block "package_versions" do
  block do
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
	    Chef::Log.warn("File #{current_package_file} does not exist, nothing will be deployed, but this can't be right. Check that environment #{environment_id} is set up correctly and that there is a current build package installed for it.")
	    current_package = nil
    end

    # Which package is the database schema set to?
    if FileTest.exists?(database_schema_file)
	    db_schema_version = File.open(database_schema_file, "r").gets.first.chomp
    else
	    db_schema_version = nil
    end

    Chef::Log.debug("Analyzing what deployment is needed for environment #{environment_id}:\ndeployed_package = #{deployed_package}\ncurrent_package = #{current_package}\ndb_schema_version = #{db_schema_version}")

    if deployed_package == current_package && deployed_package == db_schema_version
	  # Everything is fine
	  Chef::Log.warn("START TOMCAT IF NOT RUNNING")
	  Chef::Log.debug("Package #{deployed_package} is deployed and current on.")
    else
	  
	  Chef::Log.info("Deployment actions are needed for environment #{environment_id}:\ndeployed_package = #{deployed_package}\ncurrent_package = #{current_package}\ndb_schema_version = #{db_schema_version}")
	  Chef::Log.warn("STOP TOMCAT")

	  if deployed_package != current_package
		  Chef::Log.info("Package #{deployed_package} is deployed, package #{current_package} needs to be deployed for environment #{environment_id}")
		  Chef::Log.warn("REPLACE #{deployed_package} WITH #{current_package}")
	  end
  
	  if deployed_package != db_schema_version
		  Chef::Log.info("Package #{deployed_package} deployed, the current database schema is #{db_schema_version} for environment #{environment_id}")
	  end

	  if current_package != db_schema_version
		  Chef::Log.info("Database needs to be upgraded or rolled back to match package #{current_package}")
		  Chef::Log.warn("UPGRADE DATABASE SCHEMA TO #{current_package} then update #{database_schema_file}")
	  end

    end
  end
end

