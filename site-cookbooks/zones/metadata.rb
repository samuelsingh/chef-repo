maintainer       "Map of Medicine"
maintainer_email "support@mapofmedicine.com"
license          "Apache 2.0"
description      "Installs/Configures zones"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

attribute "zones/name",
  :display_name => "Zone name",
  :description => "Name used to identify a particular hosting zone",
  :default => "unset"
