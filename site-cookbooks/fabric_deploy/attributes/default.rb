
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
# Another process (e.g. Hudson job) should have created a symlink to a folder for the 
# package to be deployed. The target of the symlink should be a folder whose name is
# the id of the package to deploy.
#

if File.symlink? "#{env_packages}/CURRENT"
	set[:fabric_deployment][:packages][:current] = File.basename(File.readlink("#{env_packages}/CURRENT"))
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


