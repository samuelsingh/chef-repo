name "euromd-appserver"
description "Configures Live MD application server"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[java]", "recipe[tomcat]", "recipe[map-display]", "recipe[map-display::contentloader]"

override_attributes(
  "map_display" => {
    "md_fqdn" =>  "euro-md.map-cloud-01.eu",
    "deploy_dir" =>  "/var/shared/deployment/euro-md",
    "dbhost" => "md-db-01.map-cloud-01.eu",
    "dbname" => "live_mtmdb",
    "dbuser" => "mtmuser",
    "dbpass" => "medic1"
  }
)
