name "hgpe-prod-version"
description "Specifies the HG and MDE versions currently used in production"

run_list "recipe[prod-server]"

override_attributes(
 "hg_mde" => {
   "hg_version" =>  "choices.r13.5.hudson-94",
    "mde_version" => "evidence.r5.5.hudson-94"
  }
)
