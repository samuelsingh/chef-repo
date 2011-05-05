name "md-contentuat-version"
description "MD content uat version snippet"

run_list "recipe[stage-server]"

override_attributes(
  "map_display" => {
    "version" => "2.7.1.ALL.50.38163"
  }
)
