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

environment_id = node[:fabric_deployment][:environment]
deployed_package = node[:fabric_deployment][:packages][:deployed]
current_package = node[:fabric_deployment][:packages][:current]
db_schema_version = node[:fabric_deployment][:packages][:dbschema]

ajp_ports = node[:tomcat][:ajp_ports]

env_packages = "#{node[:fabric_deployment][:env_package_dir]}/#{environment_id}"


ruby_block "package_is_current" do
  only_if do ( deployed_package == current_package && deployed_package == db_schema_version ) && ( deployed_package != "" ) end
  block do
	Chef::Log.debug("Correct packages are deployed, making sure Tomcat is running")
	ajp_ports.each do |port|
		Chef::Log.debug("Starting Tomcat on #{port}")
		result = %x{"/etc/init.d/tomcat#{port}" start}
		if $? != 0
			# May have gotten an error code because tomcat was already running
			Chef::Log.warn("Failed to start tomcat using /etc/init.d/tomcat#{port} start")
			Chef::Log.warn(result)
		end
	end

  end
end

#ruby_block "package_mismatch" do
#  not_if ( deployed_package == current_package && deployed_package == db_schema_version ) || ( current_package == "" )
#  block do
#
#	Chef::Log.info("Deployment actions are needed for environment '#{environment_id}':\ndeployed_package = '#{deployed_package}'\ncurrent_package = '#{current_package}'\ndb_schema_version = '#{db_schema_version}'")
#
#	Chef::Log.warn("NOW STOP TOMCAT")
#  end
#end

ruby_block "upgrade_package" do
  only_if do deployed_package != current_package && current_package != "" end
  block do

	Chef::Log.info("Package '#{deployed_package}' is deployed, package '#{current_package}' needs to be deployed for environment '#{environment_id}'")


	#
	# Stop Tomcat instances to allow upgrade
	#
	ajp_ports.each do |port|
		Chef::Log.debug("Stopping Tomcat on #{port} for webapp upgrade")
		result = %x{"/etc/init.d/tomcat#{port}" stop}
		if $? != 0
			# May have gotten an error code because tomcat was not running in the first place
			Chef::Log.warn("Failed to stop tomcat using /etc/init.d/tomcat#{port} stop")
			Chef::Log.warn(result)
		end
	end

	#
	# Upgrade the webapp
	#

	Chef::Log.debug("Replacing '#{deployed_package}' with '#{current_package}'")
	env_packages = "#{node[:fabric_deployment][:env_package_dir]}/#{environment_id}"
	src_package = "#{env_packages}/#{current_package}"
	if ! File.directory? src_package
		Chef::Application.fatal! "Source directory '#{src_package}' is missing, or not a directory"
	end
	
	dst_package = "#{env_packages}/DEPLOYED"
	if File.symlink? dst_package
		File.delete dst_package
	end
	if ! File.symlink(src_package, dst_package)
		Chef::Application.fatal! "Failed to create a symlink from #{src_package} to #{dst_package}"
	end
	open("#{env_packages}/current-version.txt",'w') { |f| f << current_package }
	open("#{env_packages}/deployed-#{node[:hostname]}.txt",'w') { |f| f << current_package }

	set[:fabric_deployment][:packages][:deployed] = current_package
	set[:fabric_deployment][:packages][:current] = current_package
	
	Chef::Log.warn("NOW UPGRADE DATABASE SCHEMA TO #{current_package} then update the db schema file in '#{node[:fabric_deployment][:env_package_dir]}/#{environment_id}'. Re-run chef to complete the upgrade.")

  end
end

ruby_block "db_upgrade_time" do
  only_if do current_package != db_schema_version end
  block do

	Chef::Log.info("Database needs to be upgraded or rolled back to match package '#{current_package}'")
	Chef::Log.warn("NOW UPGRADE DATABASE SCHEMA TO #{current_package} then update the db schema file in '#{node[:fabric_deployment][:env_package_dir]}/#{environment_id}'")
  end

end

file "#{env_packages}/deployed-#{node[:hostname]}.txt" do
	owner "hudson"
	group "hudson"
	mode "0644"
end

file "#{env_packages}/current-version.txt" do
	owner "hudson"
	group "hudson"
	mode "0644"
end

file "#{env_packages}/db-schema-version.txt" do
	owner "hudson"
	group "hudson"
	mode "0644"
end


