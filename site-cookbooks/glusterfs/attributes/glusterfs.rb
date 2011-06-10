if recipe?("glusterfs::server")
  set[:glusterfs][:server] = "true"
end

if recipe?("glusterfs::client")
  set_unless[:glusterfs][:client][:experimental] = "false"
end

set_unless[:glusterfs][:mounts] = Array.new
set_unless[:glusterfs][:client][:iocache] = "256"