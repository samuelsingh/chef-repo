name "glusterfs-server"
description "Configures glusterfs storage node"

run_list "recipe[aws]","recipe[glusterfs::ebs]","recipe[glusterfs::ephemeral]","recipe[glusterfs::server]","recipe[glusterfs::cifs]"

override_attributes(
  "aws" => {
    "aws_access_key" => "AKIAIB5QZCFE3LUGZHVA",
    "aws_secret_access_key" => "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"
  },
  "glusterfs" => {
    "server" => "true",
    "mounts" => ["shared", "tmp"],
    "server_ebs_volumes" => {
      "vol-2231f14b" => {
        "host" => "filer-01.map-cloud-01.eu",
        "device" => "/dev/sdh",
        "mount" => "/gfs/shared",
        "fstype" => "ext3"
      },
      "vol-bc4383d5" => {
        "host" => "filer-02.map-cloud-01.eu",
        "device" => "/dev/sdh",
        "mount" => "/gfs/shared",
        "fstype" => "ext3"
      }
    },
    "server_eph_volumes" => {
      "eph_share" => {
        "device" => "/dev/sdc",
        "fstype" => "ext3"
      }
    }
  }
)
