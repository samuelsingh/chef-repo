name "awstats"
description "Configures awstats"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[awstats]"

override_attributes(
  "awstats" => {
    "healthguides.map-cloud-01.eu" => {
      "host_regex" => "hgpe-app-0[1-2]"
    }
  }
)
