name "md-stage-version"
description "MD staging version snippet"

run_list "recipe[stage-server]"

override_attributes(
  "map_display" => {
    "version" => "2.7.0.ALL.17.37067"
  }
)
