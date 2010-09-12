name "glusterfs-server"
description "Configures glusterfs storage node"

run_list "recipe[glusterfs::server]"

override_attributes(
  "glusterfs" => {
    "server" => "true",
    "mounts" => ["shared"]
  }
)
