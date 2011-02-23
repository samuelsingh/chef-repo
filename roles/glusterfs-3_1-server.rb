name "glusterfs-3_1-server"
description "Configures glusterfs storage node"

# run_list "recipe[prod-server]","recipe[aws]","recipe[glusterfs::ebs]","recipe[glusterfs::ephemeral]","recipe[glusterfs::server]","recipe[glusterfs::cifs]"
run_list "recipe[prod-server]","recipe[aws]","recipe[glusterfs_3_1::ephemeral]","recipe[glusterfs_3_1::server]"

override_attributes(
  "aws" => {
    "aws_access_key" => "AKIAIB5QZCFE3LUGZHVA",
    "aws_secret_access_key" => "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"
  },
  "glusterfs" => {
    "primary" => "true",
    "server_eph_volumes" => {
      "eph_share" => {
        "device" => "/dev/sdc",
        "fstype" => "ext3"
      }
    }
  }
)
