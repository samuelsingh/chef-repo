name "hgpe-prod-version"
description "Specifies the HG and MDE versions currently used in production"

override_attributes(
  "hg_mde" => {
    "hg_version" =>  "choices.R12.2-Issue_3_2010-100730.183004.769.d1v1r46-August_2010-100920.093349.423.d3v17r4247_3",
    "mde_version" =>  "evidence.R4.1-Issue_3_2010-100730.183004.769.d1v1r46-August_2010-100920.093349.423.d3v17r4247_3"
  }
)
