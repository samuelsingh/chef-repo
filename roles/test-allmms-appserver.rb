name "test-allmms-appserver"
description "Configures test MD application server"

run_list "role[java_builder]", "role[tomcat]", "recipe[mms-2::application]", "recipe[mms-2::cs-tools]", "recipe[smoke_test]"

override_attributes(
  "mms" => {
    "common"=> {
      "interactive_usr"=> "dev",
      "fqdn"=> "mms.test.mapofmedicine.com",
      "dbuser"=> "mtmuser",
      "dbpass"=> "MtMUs3r",
      "dbhost"=> "stage-db-01.map-cloud-01.eu",
      "base"=> "/mnt"
    },
    "application"=> {
      "deployment"=> {
        "id"=> "1",
        "external_start"=> "0",
        "external_end"=> "10000000" 
      },
      "quartz"=> {
        "user"=> "super@nhs.com",
        "password"=> "password"
      },
      "repository"=> {
        "dbname"=> "mms_test_repo"
      },
      "mapmanager"=> {
        "dbname"=> "mms_test_mcs"
      },
      "mom"=> {
        "dbname"=> "mms_test_mappreview"
      }
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
    "user_home" => "/var/hudson-agent",
    "unpackwars" => "true"
  },
  "hudson_agent" => {
    "user" => "tomcat",
    "group" => "tomcat"
  }
)
