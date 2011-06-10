if recipe?("glusterfs::server")
  set[:glusterfs][:server] = "true"
end

if recipe?("glusterfs::client")
  set_unless[:glusterfs][:client][:experimental] = "false"
  set_unless[:glusterfs][:client][:iocache] = "256"
end

  set_unless[:glusterfs][:mounts] = Array.new
