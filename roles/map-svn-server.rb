name "map-svn-server"
description "Map of Medicine Subversion server"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
# run_list "recipe[zones]", "recipe[nfs_mounts]"
run_list "recipe[subversion]", 
	"recipe[apache2]", 
	"recipe[apache2::mod_rewrite]", 
	"recipe[apache2::mod_headers]", 
	"recipe[apache2::mod_dav]", 
	"recipe[apache2::mod_dav_svn]", 
	"recipe[apache2::mod_authnz_ldap]", 
	"recipe[apache2::mod_proxy_connect]", 
	"recipe[apache2::mod_ldap]", 
	"recipe[apache2::mod_proxy_http]", 
	"recipe[apache2::mod_status]", 
	"recipe[apache2::mod_cgi]", 
	"recipe[apache2::mod_log_config]", 
	"recipe[apache2::mod_expires]", 
	"recipe[apache2::mod_include]", 
	"recipe[apache2::mod_log_forensic]", 
	"recipe[apache2::mod_info]", 
	"recipe[map-svn::svn_repos]",
	"recipe[map-svn::vhost]"

override_attributes(
  :apache => {
    :restricted_ips => [
      "213.248.91.62",    # Fox Court IP (new)
      "80.239.136.230",   # Another Fox Court IP
      "80.239.136.226",   # Fox Court office (old)
      "93.152.106.129",   # Fox Court backup IP
      "80.239.136.225",   # Address randomly used by FoxDev servers
      "81.6.222.205",     # Kief's home
      "82.34.165.170"     # Andrew's home
    ]
  },
  :map_svn => {
    :vhost => {
      :hostname => "svn.map-cloud-01.eu",
      :srv_aliases => [ "svn-01.mapofmedicine.com", "svn.mapofmedicine.com" ]
    },
    :ldap => {
      :server => "ldap01.map-cloud-01.eu",
      :port => "389",
      :url_path => "ou=users,dc=mapofmedicine,dc=com?uid",
      :binddn => "cn=ldapadmin,dc=mapofmedicine,dc=com",
      :bindpassword => "medic2cidem"
    },
		:svn_repos => [
	  	{
	  		:repo_name => "map-test",
	  		:auth_name => "Test Repository",
	  		:ldap_group => "cn=mom-ias,ou=groups,dc=mapofmedicine,dc=com"
	  	},
	  	{
	  		:repo_name => "map-dev",
	  		:auth_name => "Map Development Source",
	  		:ldap_group => "cn=map-dev-committers,ou=groups,dc=mapofmedicine,dc=com"
	  	},
	  	{
	  		"repo_name" => "map-sys",
	  		:auth_name => "Map Infrastructure Configuration",
	  		:ldap_group => "cn=mom-ias,ou=groups,dc=mapofmedicine,dc=com"
	  	}
  	],
  	:svn_root => "/var/svn"
  }

)
