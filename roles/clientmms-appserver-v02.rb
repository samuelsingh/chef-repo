name "clientmms-appserver-v02"
description "Configures Client MMS application server"

#run_list "role[tomcat]", "recipe[mms]", "recipe[mms::cs-tools]", "recipe[mms::queue-manager]", "recipe[mms::helper-scripts]", "recipe[mms::cron]"

run_list "recipe[mms-2::cs-tools]", "recipe[mms-2::cs-batch]", "recipe[mms-2::cron]", "role[tomcat]"

override_attributes(
  "mms" => {
    "common"=> {
      "interactive_usr"=> "sysadmin",
      "fqdn"=> "localise.mapofmedicine.com",
      "dbuser"=> "mtmuser",
      "dbpass"=> "medic1",
      "dbhost"=> "clientmms-db-01.map-cloud-01.eu",
      "base"=> "/mnt/mms"
    },
    "application"=> {
      "deployment"=> {
        "name" => "Client MMS",
        "id" => "3",
        "external_start" => "20000001",
        "external_end" => "30000000"
      },
      "quartz"=> {
        "user"=> "support@mapofmedicine.com",
        "password"=> "Ogohgha8"
      },
      "repository"=> {
        "dbname"=> "crx",
        "datastore" => false
      },
      "mapmanager"=> {
        "dbname"=> "mapmanager_mcs"
      },
      "mom"=> {
        "dbname"=> "mappreview"
      },
      "cron"=> {
        "startstopudrs"=> "true",
        "movepackages"=> "true"
      },
      "live_md" => {
        "name" => "Euro MD",
        "url" => "http://app.mapofmedicine.com"
      },
      "athens_link" => "true",
      "multiple_views" => "true"
    }
  },
  "glusterfs" => {
    "client" => {
      "stable" => "true",
      "iocache" => "32"
    }
  },
  "tomcat" => {
    "srv_dir" => "/var/tomcat",
    "log_rotate_dir" => "/var/shared/rotated-logs",
    "unpackwars" => "true"
  }
)

