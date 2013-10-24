name "trainingmms-appserver-v01"
description "Configures Training MMS application server"

#run_list "role[tomcat]", "recipe[mms]", "recipe[mms::cs-tools]", "recipe[mms::queue-manager]", "recipe[mms::helper-scripts]", "recipe[mms::cron]"

run_list "role[tomcat-v01]", "recipe[mms-2::application]", "recipe[mms-2::cs-tools]", "recipe[mms-2::cs-batch]", "role[prod-jenkins-agent]"

override_attributes(
  "mms" => {
    "common"=> {
      "interactive_usr"=> "sysadmin",
      "fqdn"=> "training-mms.mapofmedicine.com",
      "dbuser"=> "mtmuser",
      "dbpass"=> "MtMUs3r",
      "dbhost"=> "sspreprod-db-01.map-cloud-01.eu",
      "base"=> "/mnt/mms"  
	  
	  
    },
    "application"=> {
      "deployment"=> {
        "name" => "Training MMS",
        "id" => "50",
        "external_start" => "30000001",
        "external_end" => "40000000",
	"me_url1" => "http://training-mms.mapofmedicine.com/mapmanager/mapeditor/"
		
      },
      "quartz"=> {
        "user"=> "quartz@mapofmedicine.com",
        "password"=> "SoZ8siMi"
      },
      "repository"=> {
        "dbname"=> "training_repo"
      },
      "mapmanager"=> {
        "dbname"=> "training_mcs"
      },
      "mom"=> {
        "dbname"=> "training_preview"
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
      "stable" => "true"
    }
  },
  "tomcat" => {
    "srv_dir" => "/var/tomcat",
    "log_rotate_dir" => "/var/shared/rotated-logs",
    "unpackwars" => "true"
  }
)

