if recipe?("glusterfs::server")
  set[:glusterfs][:server] = "true"
end

  set_unless[:glusterfs][:mounts] = Array.new