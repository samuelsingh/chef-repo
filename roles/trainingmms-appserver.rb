name "trainingmms-appserver"
description "Configures Client MMS application server"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[java]", "recipe[tomcat]", "recipe[mms]", "recipe[mms::cs-tools]", "recipe[mms::queue-manager]"
default_attributes(
  "mms" => {
    "dbhost" => "lightmms-db-01.map-cloud-01.eu"
  }
)
override_attributes(
  "mms" => {
    "fqdn" =>  "training-mms.map-cloud-01.eu",
    "deploy_dir" =>  "/var/shared/deployment/training-mms",
    "deployment_name" => "Training MMS",
    "contentpath" => "/var/mms/content-out",
    "content_in" => "/var/mms/content-in",
    "version" => "2.6.4.3.ALL.4.36087",
    "deployment" => {
      "id" => "50",
      "external_start" => "30000001",
      "external_end" => "40000000"
    },
    "quartz" => {
      "user" => "support@mapofmedicine.com",
      "password" => "Ogohgha8"
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
  }
)
