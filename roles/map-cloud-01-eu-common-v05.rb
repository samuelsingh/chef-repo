name "map-cloud-01-eu-common-v05"
description "Configuration in md-app servers"
run_list "recipe[standard_users]", "recipe[sudo]" 

override_attributes(
  "zones" => {
    "name" =>  "euaws"
  },
  "snmpd" => {
    "community" => "ufahji3K",
    "syslocation" => "map-cloud-01.eu, amazon eu-west-1",
    "syscontact" => "systems@mapofmedicine.com"
  },
  "ec2" => {
    "ec2_access_key" => "",
    "ec2_secret_key" => ""
  }
)
