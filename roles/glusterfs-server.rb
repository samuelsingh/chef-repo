name "glusterfs-server"
description "Configures glusterfs storage node"

run_list "recipe[glusterfs::server]"

override_attributes(
  "glusterfs" => {
    "server" => "true",
    "mounts" => ["shared", "tmp"],
    "server_ebs_volumes" => {
      "vol-2231f14b" => {
        "host" => "filer-01.map-cloud-01.eu",
        "device" => "/dev/sdh1",
        "mount" => "/gfs/shared",
        "fstype" => "ext3"
      },
      "vol-bc4383d5" => {
        "host" => "filer-02.map-cloud-01.eu",
        "device" => "/dev/sdh1",
        "mount" => "/gfs/shared",
        "fstype" => "ext3"
      }
    },
    "server_eph_volumes" => {
      "tmp" => {
        "device" => "/dev/sdc",
        "fstype" => "ext3"
      }
    }
  }
)
