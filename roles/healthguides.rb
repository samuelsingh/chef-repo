{
    "name": "healthguides",
    "default_attributes": {
    },
    "json_class": "Chef::Role",
    "run_list": [
      "recipe[apache2]",
      "recipe[apache2::mod_proxy_connect]",
      "recipe[apache2::mod_proxy_http]",
      "recipe[apache2::mod_proxy]",
      "recipe[apache2::mod_proxy_ajp]",
      "recipe[apache2::mod_rewrite]",
      "recipe[java]",
      "recipe[tomcat]",
      "recipe[hg_vhost]",
      "recipe[hgmde]"
    ],
    "description": "",
    "chef_type": "role",
    "override_attributes": {
    }
  }
