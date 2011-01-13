name "uat-corporate-site"
description "Configures modx to host the corporate site"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "role[web-server]", "recipe[modx-revolution]"

override_attributes(
  "modx" => {
    "dbuser" => "modx",
    "dbpass" => "ai9Aebo2",
    "dbhost" => "confluencedb.cmn42a62dcbh.eu-west-1.rds.amazonaws.com",
    "dbname" => "modx",
    "hostname" => "corporate.uat.mapofmedicine.com",
    "srv_aliases" => []
  }
)