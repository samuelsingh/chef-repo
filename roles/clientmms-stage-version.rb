name "clientmms-stage-version"
description "Root MMS staging version snippet"

run_list "recipe[stage-server]"

override_attributes(
  "mms" => {
    "version" => "2.7.0.ALL.19.37260",
    "me_version" => "7.7.0",
    "dict_version" => "0.2"
  }
)
