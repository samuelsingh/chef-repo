name "integration2-md-prod-version"
description "MD stage version snippet"

# This should change to recipe[prod-server] when Euro MD
# goes live. Changed to prod.
run_list "recipe[stage-server]"

override_attributes(
  "map_display" => {
    "version" => "2.7.0.ALL.25.37384"
  }
)                     
