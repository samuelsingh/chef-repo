name "trainmms-stage-version"
description "Training MMS staging version snippet"

run_list "recipe[stage-server]"

override_attributes(
  "mms" => {
    "version" => "2.7.0.ALL.10.36917",
    "me_version" => "7.6.9",
    "dict_version" => "0.2"
  }
)
