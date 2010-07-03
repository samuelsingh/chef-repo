name "map-cloud-01-eu-common"
description "Configuration common to all machines in map-cloud-01.eu"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[zones]", "recipe[nfs_mounts]", "recipe[standard_users]", "recipe[sudo]", "recipe[openssh-server-ec2]", "recipe[exim::satellite]", "recipe[extra-repos]", "recipe[mom-scripts]", "recipe[ntp]", "recipe[snmpd]"

override_attributes(
  "zones" => {
    "name" =>  "euaws"
  },
  "snmpd" => {
    "community" => "ufahji3K",
    "syslocation" => "map-cloud-01.eu, amazon eu-west-1",
    "syscontact" => "systems@mapofmedicine.com"
  }
)
