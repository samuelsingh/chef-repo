name "hgpe-prod-version"
description "Specifies the HG and MDE versions currently used in production"

run_list "recipe[prod-server]"

override_attributes(
 "hg_mde" => {
   "hg_version" =>  "choices.r13.4.hudson-81",
    "mde_version" => "evidence.r5.4.hudson-81"
  }
)
