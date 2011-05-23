name "ntt-euromd-server"
description "Configures Live MD application server"

run_list "recipe[java]", "recipe[tomcat]", "role[web-server]", "recipe[map-display-3::application]", "recipe[map-display-3::contentloader]", "recipe[map-display-3::vhost]", "recipe[map-display-3::lpa_vhost]", "recipe[map-display-3::rotate_logs]", "recipe[map-display-3::time_transactions]"

override_attributes(
  "map_display" => {
    "common" => {
      "dbhost" => "raspberry.mapofmedicine.com",
      "dbname" => "live_mtmdb",
      "dbuser" => "mtmuser",
      "dbpass" => "medic1"
    },
    "application" => {
      "md_fqdn" =>  "app.ntt.mapofmedicine.com",
      "geoip_server" => "geoip.mapofmedicine.com",
      "save_ram" => "true"
    },
    "contentloader" => {
      "path" => "/usr/local/contentloader",
      "dist_path" => "/usr/local/contentloader-dist"
    },
    "time_transactions" => {
      "base" => "/usr/local/webinject",
      "user" => "webinject",
      "group" => "webinject",
      "out_dir" => "/var/shared/webinject"
    },
    "vhost" => {
      "app.ntt.mapofmedicine.com" => {
        "srv_aliases" => ["app.mapofmedicine.info"],
        "holding_page" => "false",
        "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
        "appserver" => "127.0.0.1",
        "lb_alive_port" => 0
      }
    },
    "lpa_vhost" => {
      "localcare.ntt.mapofmedicine.com" => {
        "srv_aliases" => [],
        "holding_page" => "false",
        "appserver" => "127.0.0.1",
        "lb_alive_port" => 0
      }
    }
  },
  "tomcat" => {
    "srv_dir" => "/var/tomcat",
    "log_rotate_dir" => "/var/shared/rotated-logs",
    "unpackwars" => "true"
  }
)
