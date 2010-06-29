name "prod-lb-vhosts"
description "Configures apache vhosts using a dedicated ELB for production use"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[map-display-vhost]"

override_attributes(
  "map_display_vhost" => {
    "app.map-cloud-01.eu" => {
      "srv_aliases" => [],
      "deploy_dir" => "/var/shared/deployment/app",
      "appserver" => "md-app-01.map-cloud-01.eu",
      "restricted_ips" => [],
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
      "lb_alive_port" => 8050
    }
  }
)
