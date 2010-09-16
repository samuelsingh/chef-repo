name "hgpe-prod-version"
description "Specifies the HG and MDE versions currently used in production"

override_attributes(
  "hg_mde" => {
    "hg_version" =>  "choices.R12.2-Issue_3_2010-100730.183004.769.d1v1r46-April-2010-100512.184411.158.d3v17r3494-E+W-01",
    "mde_version" =>  "evidence.R4.1-Issue_3_2010-100730.183004.769.d1v1r46-April-2010-100512.184411.158.d3v17r3494-E+W-01"
  }
)
