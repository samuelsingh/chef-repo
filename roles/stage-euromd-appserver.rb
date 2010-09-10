name "stage-euromd-appserver"
description "Configures Stage MD application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[map-display]", "recipe[map-display::contentloader]"

default_attributes "map_display" => {"md_fqdn" =>  "stage-euromd.map-cloud-01.eu","dbname" => "live_mtmdb"}
override_attributes "map_display" => {"deploy_dir" =>  "/var/shared/deployment/stage/euro-md","dbhost" => "stage-db-02.map-cloud-01.eu","dbuser" => "mtmuser","dbpass" => "medic1"}
