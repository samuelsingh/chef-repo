name "map-cloud-01-eu-common-v02"
description "Configuration common to all machines in map-cloud-01.eu. V0.2"
run_list "recipe[zones]", "recipe[glusterfs::client]", "recipe[standard_users]", "recipe[sudo]", "recipe[openssh-server-ec2]", "recipe[exim::satellite]", "recipe[extra-repos]", "recipe[mom-scripts]", "recipe[ntp]", "recipe[snmpd]", "recipe[zenoss::client]", "role[rsyslog-mom-client]"

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
