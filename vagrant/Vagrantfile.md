Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "base"

  config.vm.customize do |vm|
    vm.memory_size = 1740
  end 

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host only network IP, allowing you to access it
  # via the IP.
  # config.vm.network "33.33.33.10"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port "http", 80, 8080

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "/home/andrew/svn/chef-experimental/chef-repo/site-cookbooks"
    chef.json = {
      "domain" => "mapofmedicine.com",
      "hostname" => "local-build",
      "fqdn"=> "local-build.mapofmedicine.com",
      "map_display" => {
        "md_fqdn" => "127.0.0.1:8080",
        "save_ram" => "true",
        "dbhost" => "hathor.foxdev.mapofmedicine.com",
        "dbname" => "test_mapdisplay",
        "dbuser" => "mtmuser",
        "dbpass" => "medic1"
      },
      "tomcat" => { "ajp_ports" => [ 9001, 9002 ] }
    }
    chef.add_recipe("extra-repos")
    chef.add_recipe("java")
    chef.add_recipe("tomcat")
    chef.add_recipe("map-display-2")
  end

end
