name "integration-md-appserver"
description "Configures  Integration application server"

run_list "recipe[java]", "role[tomcat]", "recipe[map-display-3::application]", "recipe[map-display-3::contentloader]", "recipe[map-display-3::rotate_logs]"

override_attributes(
  "map_display" => {
    "common" => {
      "dbhost" => "md-db-01.map-cloud-01.eu",
      "dbname" => "integration_mtmdb",
      "dbuser" => "mtmuser",
      "dbpass" => "medic1"
    },
    "application" => {
      "md_fqdn" =>  "integration.mapofmedicine.com",
      "geoip_server" => "geoip.mapofmedicine.com",
      "save_ram" => "true"
    },
    "contentloader" => {
      "path" => "/usr/local/contentloader",
      "dist_path" => "/usr/local/contentloader-dist"
    }
  },
  "tomcat" => {
    "srv_dir" => "/var/tomcat",
    "log_rotate_dir" => "/var/shared/rotated-logs",
    "unpackwars" => "true"
  }
)
