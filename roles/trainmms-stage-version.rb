name "trainmms-stage-version"
description "Training MMS staging version snippet"

override_attributes(
  "mms" => {
    "version" => "2.6.5.ALL.12.36722",
    "me_version" => "7.6.9",
    "dict_version" => "0.2"
  }
)
