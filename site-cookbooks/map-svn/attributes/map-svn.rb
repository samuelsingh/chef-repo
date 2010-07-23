# Cookbook Name:: map-svn
# Attribute File:: map-svn

#if recipe?("map-svn::vhost")
#  set[:map-svn] = "true"
#end

if recipe?("map_svn::vhost")
  set_unless[:map_svn][:vhost][:hostname] = "unset.unset.com"
  set_unless[:map_svn][:vhost][:srv_aliases] = []
  set_unless[:map_svn][:svn_root] = "/var/svn"
  set_unless[:map_svn][:svn_repos] = []
  set_unless[:map_svn][:ldap][:server] = "unset.unset.com"
  set_unless[:map_svn][:ldap][:port] = "389"
  set_unless[:map_svn][:ldap][:url_path] = "unset"
  set_unless[:map_svn][:ldap][:binddn] = "unset"
  set_unless[:map_svn][:ldap][:bindpassword] = "unset"
  set_unless[:apache][:restricted_ips] = []
end

