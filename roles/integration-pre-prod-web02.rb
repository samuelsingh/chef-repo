name "integration-pre-prod-web02"
description "Configure preprod Web-02 Server"

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
      "preprod.mapofmedicine.com" => {
        "srv_aliases" => ["preprod.mapofmedicine.info"],
        "holding_page" => "false",
        "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
        "appserver" => "preprod-app-02.map-cloud-01.eu",
	"lb_alive_port" => 8050
      }
    }
  }
)
