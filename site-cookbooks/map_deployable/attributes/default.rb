
set_unless[:fabric_deployment][:environment] = "unknown"

set[:fabric_deployment][:env_package_dir] = "/var/shared/fabric-pipeline/deploy"

environment_id = node[:fabric_deployment][:environment]
env_packages = "#{node[:fabric_deployment][:env_package_dir]}/#{environment_id}"

#
# Which package actually is deployed?
#
set_unless[:fabric_deployment][:packages][:deployed] = ""

#
# Which package should be deployed?
#
# This file should be updated by another process (e.g. Hudson job) which sets the 
# package version to be deployed.
#
current_package_file = "#{env_packages}/current-version.txt"
if FileTest.size?(current_package_file)
	set[:fabric_deployment][:packages][:current] = File.open(current_package_file, "r").gets.first.chomp
else
	set_unless[:fabric_deployment][:packages][:current] = ""
end

#
# What is the database schema version?
#
database_schema_file = "#{env_packages}/db-schema-version.txt"
if FileTest.size?(database_schema_file)
	# TODO: This should be replaced by a call directly to the database
	set[:fabric_deployment][:packages][:dbschema] = File.open(database_schema_file, "r").gets.first.chomp
else
	set_unless[:fabric_deployment][:packages][:dbschema] = ""
end


