if recipe?("glusterfs::server")
  set[:glusterfs][:server] = "true"
end