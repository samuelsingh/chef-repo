name "stage-trainingmms-appserver"
description "Configures Client MMS application server"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[java]", "recipe[tomcat]", "recipe[mms]", "recipe[mms::cs-tools]", "recipe[mms::queue-manager]"
default_attributes(
  "mms" => {
    "dbhost" => "stage-db-01.map-cloud-01.eu"
  }
)
override_attributes(
  "mms" => {
    "fqdn" =>  "stage-trainmms.map-cloud-01.eu",
    "deploy_dir" =>  "/var/shared/deployment/stage/training-mms",
    "deployment_name" => "Training MMS",
    "contentpath" => "/var/mms/content-out",
    "content_in" => "/var/mms/content-in",
    "deployment" => {
      "id" => "50",
      "external_start" => "30000001",
      "external_end" => "40000000"
    },
    "quartz" => {
      "user" => "quartz@mapofmedicine.com",
      "password" => "SoZ8siMi"
    },
    "mapmanager" => {
      "dbname" => "training_mcs"
    },
    "repository" => {
      "dbname" => "training_repo"
    },
    "mom" => {
      "dbname" => "training_preview"
    },
    "athens_link" => "true",
    "multiple_views" => "true",
    "dbuser" => "mtmuser",
    "dbpass" => "MtMUs3r"
  },
  "glusterfs" => {
    "client" => {
      "experimental" => "true"
    }
  }
)
