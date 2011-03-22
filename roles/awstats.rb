name "awstats"
description "Configures awstats"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[awstats]"

override_attributes(
  "awstats" => {
    "healthguides.mapofmedicine.com" => {
      "host_regex" => "hgpe-app-0[1-9]"
    },
    "eng.mapofmedicine.com" => {
      "host_regex" => "hgpe-app-0[1-9]"
    },
    "training-mms.mapofmedicine.com" => {
      "host_regex" => "prod-web-0[1-9]"
    },
    "mms.mapofmedicine.com" => {
      "host_regex" => "prod-web-0[1-9]"
    },
    "mapofmedicine.com" => {
      "host_regex" => "prod-web-0[1-9]"
    },
    "localise.mapofmedicine.com" => {
      "host_regex" => "prod-web-0[1-9]"
    }
  }
)
