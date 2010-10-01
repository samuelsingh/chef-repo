name "glusterfs-client"
description "Configures glusterfs client"

run_list "recipe[glusterfs::client]"

override_attributes(
  "glusterfs" => {
    "client" => {
      "mounts" => ["shared,/var/shared","eph_share,/var/eph_share"]
    }
  }
)