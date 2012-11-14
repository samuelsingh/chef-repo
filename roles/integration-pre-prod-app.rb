name "integration-pre-prod-app"
description "Configures  Integration application server"

run_list "recipe[tomcat]", "recipe[map-display-3::application]", "recipe[map-display-3::contentloader]", "recipe[map-display-3::rotate_logs]"

override_attributes(
  "map_display" => {
    "common" => {
      "dbhost" => "me-md3-db-01.map-cloud-01.eu",
      "dbname" => "live_mtmdb",
      "dbuser" => "mtmuser",
      "dbpass" => "medic1"
    },
    "application" => {
      "md_fqdn" =>  "meapp.mapofmedicine.com",
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
