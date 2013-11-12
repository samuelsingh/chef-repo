name "rootmms-appserver-v01"
description "Configures Root MMS application server"

#run_list "role[tomcat]", "recipe[mms]", "recipe[mms::cs-tools]", "recipe[mms::queue-manager]", "recipe[mms::helper-scripts]", "recipe[mms::cron]"

run_list "role[tomcat-v01]", "recipe[mms-2::application]", "recipe[mms-2::cs-tools]", "recipe[mms-2::cs-batch]", "role[prod-jenkins-agent]"

override_attributes(
  "mms" => {
    "common"=> {
      "interactive_usr"=> "sysadmin",
      "fqdn"=> "mms.mapofmedicine.com",
      "dbuser"=> "mtmuser",
      "dbpass"=> "medic1q",
      "dbhost"=> "lightmms-db-01.map-cloud-01.eu",
      "base"=> "/mnt/mms"
    },
    "application"=> {
      "deployment"=> {
        "name" => "Root MMS",
        "id" => "1",
        "external_start" => "0",
        "external_end" => "10000000"
      },
      "quartz"=> {
        "user"=> "quartz@mapofmedicine.com",
        "password"=> "aer5miFa"
      },
      "repository"=> {
        "dbname"=> "crx",
      },
      "mapmanager"=> {
        "dbname"=> "mcs"
      },
      "mom"=> {
        "dbname"=> "mappreview"
      },
      "live_md" => {
        "name" => "Euro MD",
        "url" => "http://app.mapofmedicine.com"
      },
      "athens_link" => "false",
      "multiple_views" => "false"
    }
  },
  "glusterfs" => {
    "client" => {
      "stable" => "true"
    }
  },
  "tomcat" => {
    "srv_dir" => "/var/tomcat",
    "log_rotate_dir" => "/var/shared/rotated-logs",
    "unpackwars" => "true"
  }
)

