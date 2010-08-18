#!/usr/bin/ruby -w

require 'erb'
require 'digest/sha1'
require 'base64'
require 'password'
require 'rubygems'
require 'optparse'

options = {}
tempfile = '/tmp/ldap-user.tmp'

optparse = OptionParser.new do|opts|
    opts.on( '-u', '--user USER', "Username" ) do|u|
          options[:user] = u
    end
    opts.on( '-f', '--first FIRSTNAME', "First Name" ) do|f|
          options[:fname] = f
    end
    opts.on( '-l', '--last LASTNAME', "Last Name" ) do|l|
          options[:lname] = l
    end
    opts.on( '-e', '--email EMAIL', "Email address" ) do|e|
          options[:email] = e
    end
    opts.on_tail( '-h', '--help', 'Display this screen' ) do
        puts opts
        exit
    end
end

optparse.parse!

unless options.length == 4
  puts optparse.on_tail
  exit
end

#puts "Username: #{options[:user]}"
#puts "First Name: #{options[:fname]}"
#puts "Last Name: #{options[:lname]}"
#puts "Email: #{options[:email]}"

ldif_template = ERB.new <<-EOF

dn: uid=<%= options[:user] %>,ou=users,dc=mapofmedicine,dc=com
objectclass: top
objectclass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
objectClass: gosaAccount
uid: <%= options[:user] %>
gn: <%= options[:fname] %>
sn: <%= options[:lname] %>
cn: <%= options[:fname] %> <%= options[:lname] %>
cn: <%= options[:lname] %>, <%= options[:fname] %>
mail: <%= options[:email] %>
userPassword: <%= password['ssha'] %>

EOF

salt = 'xx'

def generatePassword
        salt = '99'
        plain_password = Password.phonemic( 8, Password::ONE_CASE | Password::ONE_DIGIT )
        ssha_password = "{SSHA}" + Base64.encode64(Digest::SHA1.digest(plain_password + salt) + salt).chomp!
        return { 'plain' => plain_password, 'ssha' => ssha_password }
end

password = generatePassword

File.open(tempfile, 'w') do |f|
  f.puts ldif_template.result(binding)
end

add_user=system("ldapadd -D 'cn=ldapadmin,dc=mapofmedicine,dc=com' -W -x -f #{tempfile}")

#ToDo: make this work properly!

#if add_user == 0
#  puts "User #{options[:user]} added successfully"
#else
#  puts "Could not add #{options[:user]} to LDAP"
#end

File.delete(tempfile)
