name "md-stage-version"
description "MD staging version snippet"

run_list "recipe[stage-server]"

override_attributes(
  "map_display" => {
    "version" => "2.6.5.ALL.1.36493"
  }
)
