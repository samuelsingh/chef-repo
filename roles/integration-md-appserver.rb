name "integration-md-appserver"
description "Configures Production MD application server on the integration server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[map-display]", "recipe[map-display::contentloader]"

override_attributes(
  "map_display" => {
    "md_fqdn" =>  "integration.mapofmedicine.com",
    "deploy_dir" =>  "/var/shared/deployment/prod/integration-md",
    "dbhost" => "md-db-01.map-cloud-01.eu",
    "dbname" => "integration_mtmdb",
    "dbuser" => "mtmuser",
    "dbpass" => "medic1"
  }
)

