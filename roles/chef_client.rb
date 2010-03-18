name "chef-client"
description "Configure chef clients to connect to the server."
recipes "chef::client"
override_attributes(
  "chef" => {
    "url_type" => "https",
    "init_style" => "init",
    "server_fqdn" => "chef-test-01.foxdev.mapofmedicine.com",
    "validation_token" => "8c62e915e6af575240a8916295e90ccd9c0acea510fc0e71f70b06b4a8438083"
  }
)
