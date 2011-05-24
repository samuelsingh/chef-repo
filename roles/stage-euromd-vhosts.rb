name "stage-euromd-vhosts"
description "Configures apache vhosts for MD staging use"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[map-display-3::vhost]", "recipe[map-display-3::lpa_vhost]", 

override_attributes(
   "vhost" => {
      "euromd.regression.mapofmedicine.com" => {
        "srv_aliases" => [],
        "holding_page" => "false",
        "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
        "appserver" => "stage-euromd-app-01.map-cloud-01.eu",
        "lb_alive_port" => 0
      }
    }
)
#    "lpa_vhost" => {
#        "localcare.regression.mapofmedicine.com" => {
#        "srv_aliases" => [],
#        "holding_page" => "false",
#        "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
#        "appserver" => "stage-euromd-app-01.map-cloud-01.eu",
#        "lb_alive_port" => 0
#     }
#   }
    
