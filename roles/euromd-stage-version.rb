name "euromd-prod-version"
description "MD staging version snippet"

# This should change to recipe[prod-server] when Euro MD
# goes live.
run_list "recipe[stage-server]"

override_attributes(
  "map_display" => {
    "version" => "md-2.7.ALL.25.37384"
  }
)
