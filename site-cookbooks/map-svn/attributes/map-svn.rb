# Cookbook Name:: map-svn
# Attribute File:: map-svn

if recipe?("map-svn::server")
  set[:svn][:server] = "true"
end

if recipe?("map-svn::vhost")
  set_unless[:map-svn][:vhost][:hostname] = "unset.unset.com"
  set_unless[:map-svn][:vhost][:srv_aliases] = []
  set_unless[:map-svn][:svn_root] = "/var/svn"
  set_unless[:map-svn][:svn_repos] = []
  set_unless[:map-svn][:ldap][:server] = "unset.unset.com"
  set_unless[:map-svn][:ldap][:port] = "389"
  set_unless[:map-svn][:ldap][:url_path] = "unset"
  set_unless[:map-svn][:ldap][:binddn] = "unset"
  set_unless[:map-svn][:ldap][:bindpassword] = "unset"
  set_unless[:apache][:restricted_ips] = []
end

