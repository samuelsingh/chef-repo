name "stage-clientmms-appserver"
description "Configures Stage Client MMS application server"

run_list "role[tomcat]", "recipe[mms-2::application]", "recipe[mms-2::cs-tools]", "recipe[mms-2::cs-batch]"

override_attributes(
  "mms" => {
    "common"=> {
      "interactive_usr"=> "sysadmin",
      "fqdn"=> "localise.regression.mapofmedicine.com",
      "dbuser"=> "mtmuser",
      "dbpass"=> "medic1",
      "dbhost"=> "stage-db-02.map-cloud-01.eu",
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
        "datastore"=> "false"
      },
      "mapmanager"=> {
        "dbname"=> "mapmanager_mcs"
      },
      "mom"=> {
        "dbname"=> "mappreview"
      },
      "live_md" => {
        "name" => "MD Regression",
        "url" => "http://euromd.regression.mapofmedicine.com"
      },
      "athens_link" => "true",
      "multiple_views" => "true"
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
