name "web-server"
description "Configuration common to all hosts"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[apache2]", "recipe[apache2::mod_rewrite]", "recipe[apache2::mod_proxy_ajp]", "recipe[apache2::mod_headers]", "recipe[apache2::mod_dav]", "recipe[apache2::mod_ssl]", "recipe[apache2::mod_authnz_ldap]", "recipe[apache2::mod_proxy_connect]", "recipe[apache2::mod_ldap]", "recipe[apache2::mod_php5]", "recipe[apache2::mod_proxy_http]", "recipe[apache2::mod_status]", "recipe[apache2::mod_cgi]", "recipe[apache2::mod_log_config]", "recipe[apache2::mod_expires]", "recipe[apache2::mod_include]", "recipe[apache2::mod_log_forensic]", "recipe[apache2::mod_info]"

override_attributes(
  "apache" => {
    "restricted_ips" => [
      "213.248.91.62",    # Fox Court IP (new)
      "80.239.136.230",   # Another Fox Court IP
      "80.239.136.226",   # Fox Court office (old)
      "93.152.106.129",   # Fox Court backup IP
      "80.239.136.225",   # Address randomly used by FoxDev servers
      "86.166.206.203",   # Gerard's home
      "82.34.165.170"     # Andrew's home
    ]
  }
)
