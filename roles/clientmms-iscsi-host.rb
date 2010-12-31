name "clientmms-iscsi-host"
description "Configures iscsi host for Client MMS"

run_list "recipe[prod-server]","recipe[aws]","recipe[tgt-iscsi]"

override_attributes(
  "aws" => {
    "aws_access_key" => "AKIAIB5QZCFE3LUGZHVA",
    "aws_secret_access_key" => "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"
  },
  "tgt_iscsi" => {
    "volumes" => [
      "vol-e6f02b8f,/dev/sdd",
      "vol-f8f02b91,/dev/sde",
      "vol-faf02b93,/dev/sdf",
      "vol-f4f02b9d,/dev/sdg",
      "vol-c8f02ba1,/dev/sdh",
      "vol-caf02ba3,/dev/sdi"
    ]
  }
)
