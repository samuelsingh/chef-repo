name "md-stage-version"
description "MD staging version snippet"

run_list "recipe[stage-server]"

override_attributes(
  "map_display" => {
    "version" => "md-2.7.ALL.10.36917"
  }
)
