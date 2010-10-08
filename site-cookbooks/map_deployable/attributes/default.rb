
set_unless[:fabric_deployment][:environment] = "unknown"

set[:fabric_deployment][:env_package_dir] = "/var/shared/fabric-pipeline/deploy"

environment_id = node[:fabric_deployment][:environment]
env_packages = "#{node[:fabric_deployment][:env_package_dir]}/#{environment_id}"

#
# Which package should be deployed?
#
current_package_file = "#{env_packages}/current-version.txt"
if FileTest.exists?(current_package_file)
	set[:fabric_deployment][:packages][:current] = File.open(current_package_file, "r").gets.first.chomp
else
	set[:fabric_deployment][:packages][:current] = ""
end

#
# Which package actually is deployed?
#
deployed_here_file = "#{env_packages}/deployed-#{node[:hostname]}.txt"
if FileTest.exists?(deployed_here_file)
	set[:fabric_deployment][:packages][:deployed] = File.open(deployed_here_file, "r").gets.first.chomp
else
	set[:fabric_deployment][:packages][:deployed] = ""
end

#
# What is the database schema version?
#
database_schema_file = "#{env_packages}/db-schema-version.txt"
if FileTest.exists?(database_schema_file)
	set[:fabric_deployment][:packages][:dbschema] = File.open(database_schema_file, "r").gets.first.chomp
else
	set[:fabric_deployment][:packages][:dbschema] = ""
end


