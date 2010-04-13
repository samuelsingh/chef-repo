maintainer       "Map of Medicine"
maintainer_email "support@mapofmedicine.com"
license          "Apache 2.0"
description      "Installs/Configures nfs_mounts"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

attribute "nfs_mounts",
  :display_name => "nfs_mounts",
  :description => "Hash of NFS mount points",
  :type => "hash"

attribute "nfs_mounts/name",
  :display_name => "mount point",
  :description => "Name of mount point",
  :type => "hash"

attribute "nfs_mounts/name/host",
  :display_name => "host",
  :description => "NFS host",
  :default => ""

attribute "nfs_mounts/name/hostdir",
  :display_name => "host directory",
  :description => "NFS mount point host directory",
  :default => ""

attribute "nfs_mounts/name/clientdir",
  :display_name => "client directory",
  :description => "NFS mount point client directory",
  :default => ""
