Vagrant::Config.run do |config|

  # Custom MoM vars
  dist_mount = "/dist_in"
  
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
  config.vm.forward_port "http", 8080, 8080
  config.vm.forward_port "http2", 8081, 8081

  # This line allows a host folder to be mounted on the guest.  Useful when transferring
  # New warfiles to the guest tomcat.
  config.vm.share_folder "dist_in", "/dist_in", "< set me to /path/to/war/output/dir >"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "< set me to path to chef repo >/site-cookbooks"
    chef.json = {
      "domain" => "mapofmedicine.com",
      "hostname" => "local-build",
      "fqdn"=> "local-build.mapofmedicine.com",
      "map_display" => {
        "common" => {
          "dbhost" => "< set me >",
          "dbname" => "< set me >",
          "dbuser" => "< set me >",
          "dbpass" => "< set me >",
          "dbtype" => "< set me, (mysql|mssql), defaults to mssql if omitted >"
        },
        "application" => {
          "md_fqdn" =>  "127.0.0.1:8080",
          "geoip_server" => "geoip.mapofmedicine.com",
          "save_ram" => "true"
        }
      },
      "tomcat" => {
        "ajp_ports" => [ 9001, 9002 ],
        "unpackwars" => "true"
      }
    }
    chef.add_recipe("extra-repos")
    chef.add_recipe("java")
    chef.add_recipe("tomcat")
    chef.add_recipe("map-display-3")
  end

end
