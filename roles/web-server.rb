name "web-server"
description "Configuration common to all hosts"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list: [ 
    "recipe[apache2]", 
    "recipe[apache2::mod_rewrite]", 
    "recipe[apache2::mod_proxy_ajp]",
    "recipe[apache2::mod_headers]",
    "recipe[apache2::mod_dav]",
    "recipe[apache2::mod_ssl]",
    "recipe[apache2::mod_authnz_ldap]",
    "recipe[apache2::mod_proxy_connect]",
    "recipe[apache2::mod_ldap]",
    "recipe[apache2::mod_php5]",
    "recipe[apache2::mod_proxy_http]",
    "recipe[apache2::mod_status]",
    "recipe[apache2::mod_cgi]",
    "recipe[apache2::mod_log_config]",
    "recipe[apache2::mod_expires]",
    "recipe[apache2::mod_include]",
    "recipe[apache2::mod_log_forensic]",
    "recipe[apache2::mod_info]"
]
