name "stage-rootmms-appserver"
description "Configures Stage Root MMS application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[mms]", "recipe[mms::cs-tools]", "recipe[mms::queue-manager]"
default_attributes(
  "mms" => {
    "dbhost" => "stagemms-db-01.map-cloud-01.eu"
  }
)
override_attributes(
  "mms" => {
    "fqdn" =>  "stage-db-01.map-cloud-01.eu",
    "deploy_dir" =>  "/var/shared/deployment/stage/root-mms",
    "deployment_name" => "Stage Root MMS",
    "contentpath" => "/var/mms/content-out",
    "content_in" => "/var/mms/content-in",
    "deployment" => {
      "id" => "1",
      "external_start" => "0",
      "external_end" => "10000000"
    },
    "quartz" => {
      "user" => "scott@nhs.com",
      "password" => "LetMe1n"
    },
    "mapmanager" => {
      "dbname" => "mcs"
    },
    "athens_link" => "false",
    "multiple_views" => "false",
    "dbuser" => "mtmuser",
    "dbpass" => "MtMUs3r"
  }
)
