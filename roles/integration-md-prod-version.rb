name "integration-md-prod-version"
description "MD integration prod version snippet"

# This should change to recipe[prod-server] when Euro MD
# goes live. Changed to prod.
run_list "recipe[prod-server]"

override_attributes(
  "map_display" => {
    "version" => "2.7.0.ALL.21.37297"
  }
)                     
