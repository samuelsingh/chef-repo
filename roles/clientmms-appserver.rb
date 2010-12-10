name "clientmms-appserver"
description "Configures Client MMS application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[mms]", "recipe[mms::cs-tools]", "recipe[mms::queue-manager]"

override_attributes(
  "mms" => {
    "fqdn" =>  "localise.map-cloud-01.eu",
    "deploy_dir" =>  "/var/shared/deployment/prod/client-mms",
    "deployment_name" => "Client MMS",
    "contentpath" => "/var/mms/content-out",
    "content_in" => "/var/mms/content-in",
    "dbhost" => "clientmms-db-01.map-cloud-01.eu",
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
    "datastore" => false,
    "dbuser" => "mtmuser",
    "dbpass" => "medic1"
  },
  "glusterfs" => {
    "client" => {
      "experimental" => "true"
    }
  }
)
