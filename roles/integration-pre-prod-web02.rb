name "integration-pre-prod-web01"
description "Configure Integration Web-01 Server"

run_list "role[web-server]", "recipe[map-display-3::vhost_integration]"

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
      "integration.mapofmedicine.com" => {
        "srv_aliases" => ["integration.mapofmedicine.info"],
        "holding_page" => "false",
        "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
        "appserver" => "integration-app-02.map-cloud-01.eu",
	"lb_alive_port" => 8050
      }
    }
  }
)
