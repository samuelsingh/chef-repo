name "md-stage-version"
description "MD staging version snippet"

# This role calls the recipe[stage-server] to build
# the MD release version below.
run_list "recipe[stage-server]"

override_attributes(
  "map_display" => {
    "version" => "md-2.7.ALL.25.37384"
  }
)

