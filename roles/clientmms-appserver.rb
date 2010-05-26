name "clientmms-appserver"
description "Configures Client MMS application server"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[java]", "recipe[tomcat]", "recipe[mms]"
default_attributes(
  "mms" => {
    "quartz" => {
      "user" => "quartz@mapofmedicine.com",
      "password" => "password"
    },
    "dbhost" => "clientmms-db-01.map-cloud-01.eu"
  }
)
override_attributes(
  "mms" => {
    "fqdn" =>  "localise.map-cloud-01.eu",
    "deploy_dir" =>  "/var/shared/deployment/client-mms",
    "deployment_name" => "Client MMS",
    "deployment" => {
      "id" => "3",
      "external_start" => "20000001",
      "external_end" => "30000000"
    },
    "athens_link" => "false",
    "multiple_views" => "false"
  }
)
