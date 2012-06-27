name "map-cloud-01-eu-common-v04"
description "Configuration in md-app servers"
run_list "recipe[zones]", "recipe[standard_users]", "recipe[sudo]", "recipe[openssh-server-ec2]", "recipe[exim::satellite]", "recipe[mom-scripts]", "recipe[ntp]", "recipe[snmpd]", "recipe[zenoss::client]", "recipe[rsyslog_mom]"

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
  },
  "glusterfs" => {
    "client" => {
      "stable" => "true",
      "mounts" => ["shared,/var/shared","eph_share,/var/eph_share"]
    }
  }
)
