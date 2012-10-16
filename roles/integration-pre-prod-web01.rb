name "integration-pre-prod-web01"
description "Configure preprod Web-01 Server"

run_list "role[web-server]", "recipe[map-display-3::vhost_integration]", "recipe[map-display-3::lpa_vhost]", "recipe[map-display-3::time_transactions]"

override_attributes(
"apache" => {
    "listen_ports" => [
     "80",
     "8050",
   "443"
    ]
},
  "map_display" => {
    "vhost_integration" => {
      "preprod.mapofmedicine.com" => {
        "srv_aliases" => ["preprod.mapofmedicine.info"],
        "holding_page" => "false",
        "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
        "appserver" => "preprod-app-01.map-cloud-01.eu",
	"lb_alive_port" => 8050
      }
    },
    "time_transactions" => {
      "base" => "/usr/local/webinject",
      "user" => "webinject",
      "group" => "webinject",
      "out_dir" => "/var/shared/webinject"
    },
    "lpa_vhost" => {
      "localcare.mapofmedicine.com" => {
        "srv_aliases" => [],
        "holding_page" => "false",
        "appserver" => "127.0.0.1",
        "lb_alive_port" => 0
      }
    }
  }
)
