name "rootmms-appserver"
description "Configures Root MMS application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[mms]", "recipe[mms::cs-tools]", "recipe[mms::queue-manager]", "recipe[mms::helper-scripts]"
default_attributes(
  "mms" => {
    "dbhost" => "lightmms-db-01.map-cloud-01.eu"
  }
)
override_attributes(
  "mms" => {
    "fqdn" =>  "mms.mapofmedicine.com",
    "deploy_dir" =>  "/var/shared/deployment/prod/root-mms",
    "deployment_name" => "Root MMS",
    "contentpath" => "/var/mms/content-out",
    "content_in" => "/var/mms/content-in",
    "deployment" => {
      "id" => "1",
      "external_start" => "0",
      "external_end" => "10000000"
    },
    "quartz" => {
      "user" => "quartz@mapofmedicine.com",
      "password" => "aer5miFa"
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
