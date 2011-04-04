name "ntt-euromd-server"
description "Configures Live MD application server"

run_list "recipe[java]", "recipe[tomcat]", "recipe[map-display-3::application]", "recipe[map-display-3::vhost]", "recipe[map-display-3::lpa_vhost]"

override_attributes(
  "map_display" => {
    "application" => {
      "md_fqdn" =>  "app.mapofmedicine.com",
      "dbhost" => "raspberry.mapofmedicine.com",
      "dbname" => "live_mtmdb",
      "dbuser" => "mtmuser",
      "dbpass" => "medic1"
    },
    "vhost" => {
      "app.mapofmedicine.com" => {
        "srv_aliases" => ["app.mapofmedicine.info"],
        "holding_page" => "false",
        "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
        "appserver" => "127.0.0.1",
        "lb_alive_port" => 0
      }
    },
    "lpa_vhost" => {
      "localcare.test.mapofmedicine.com" => {
        "srv_aliases" => [],
        "holding_page" => "false",
        "appserver" => "127.0.0.1",
        "lb_alive_port" => 0
      }
    }
  }
)
