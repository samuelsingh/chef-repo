name "hgpe-stage-version"
description "Specifies the HG and MDE versions currently used in production"

run_list "recipe[stage-server]"

override_attributes(
 "hg_mde" => {
   "hg_version" =>  "choices.r13.1.hudson-55",
    "mde_version" => "evidence.r5.1.hudson-55"
  }
)
