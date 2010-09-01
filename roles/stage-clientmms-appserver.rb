name "stage-clientmms-appserver"
description "Configures Client MMS application server for staging use"

run_list "recipe[java]", "recipe[tomcat]", "recipe[mms]", "recipe[mms::cs-tools]", "recipe[mms::queue-manager]"
default_attributes(
  "mms" => {
    "dbhost" => "stage-clientmms-db-01.map-cloud-01.eu"
  }
)
override_attributes(
  "mms" => {
    "fqdn" =>  "stage-clientmms.map-cloud-01.eu",
    "deploy_dir" =>  "/var/shared/deployment/stage/client-mms",
    "deployment_name" => "Stage Client MMS",
    "contentpath" => "/var/mms/content-out",
    "content_in" => "/var/mms/content-in",
    "deployment" => {
      "id" => "3",
      "external_start" => "20000001",
      "external_end" => "30000000"
    },
    "quartz" => {
      "user" => "support@mapofmedicine.com",
      "password" => "Ogohgha8"
    },
    "mapmanager" => {
      "dbname" => "mapmanager_mcs"
    },
    "athens_link" => "true",
    "multiple_views" => "true",
    "dbuser" => "mtmuser",
    "dbpass" => "MtMUs3r"
  }
)
