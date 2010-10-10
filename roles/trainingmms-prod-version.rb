name "trainingmms-prod-version"
description "Training MMS production version snippet"

run_list "recipe[prod-server]"

override_attributes(
  "mms" => {
    "version" => "2.6.5.ALL.12.36722",
    "me_version" => "7.6.9",
    "dict_version" => "0.2"
  }
)
