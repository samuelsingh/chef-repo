name "prod-vhosts"
description "Configures apache vhosts for production use"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[mms-vhost]"

override_attributes(
  "mms-vhosts" => {
    "mms.map-cloud-01.eu" => {
      "srv_aliases" => [],
      "deploy_dir" => "/var/shared/deployment/root-mms",
      "appserver" => "rootmms-test-01.map-cloud-01.eu",
      "restricted_ips" => [],
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause."
    }
  }
)
