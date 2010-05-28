name "rootmms-appserver"
description "Configures Root MMS application server"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[java]", "recipe[tomcat]", "recipe[mms]"
default_attributes(
  "mms" => {
    "quartz" => {
      "user" => "scott@nhs.com",
      "password" => "LetMe1n"
    },
    "dbhost" => "rootmms-db-01.map-cloud-01.eu"
  }
)
override_attributes(
  "mms" => {
    "fqdn" =>  "mms.map-cloud-01.eu",
    "deploy_dir" =>  "/var/shared/deployment/root-mms",
    "deployment_name" => "Map of Medicine Root MMS",
    "deployment" => {
      "id" => "1",
      "external_start" => "0",
      "external_end" => "10000000"
    },
    "athens_link" => "false",
    "multiple_views" => "false"
  }
)
