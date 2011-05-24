name "legacy-stage-sites"
description "Configures legacy dev/stage sites"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[generic_vhost]", "recipe[java]", "recipe[ant]"

override_attributes(
  "generic_vhost" => {
    "stage-web.mapofmedicine.com" => {
      "srv_aliases" => ["stagewebsite.mapofmedicine.com"],
      "docroot" => "/var/shared/deployment/dev/stage-web",
      "holding_page" => "false",
      "holding_page_msg" => "This Map of Medicine service is offline for emergency maintenance.  We apologise for any inconvenience this may cause.",
    }
  }
)
