#!/usr/bin/ruby -w

require 'ldap'
require 'digest/sha1'
require 'base64'
require 'rubygems'
require 'highline/import'
require 'password'
require 'erb'
require 'action_mailer'

email_template = ERB.new <<-EOF

You have been issued a new password to log into the Medic To Medic knowledge systems.

    Your username is: <%= username %>
    Your new password is: <%= password['plain'] %>

You can change your password and other account details at:

    http://people.mapofmedicine.com

You can use this account to log into:

    - The Confluence wiki at http://knowledge.mapofmedicine.com
    - The Jira issue tracker at http://tracking.mapofmedicine.com

Please let us know if you have any questions or problems using this account.

Regards,
The Medic to Medic Support Team
<%= support_email %>
EOF

ldap_host = 'ldap'
ldap_port = 389
ldap_version = 3
ldap_user = 'cn=ldapadmin,dc=mapofmedicine,dc=com'
base_dn = 'dc=mapofmedicine,dc=com'
user_base_dn="ou=users,#{base_dn}"
support_email = 'systems@mapofmedicine.com'


def generatePassword
        salt = '99'
        plain_password = Password.phonemic( 8, Password::ONE_CASE | Password::ONE_DIGIT )
        ssha_password = "{SSHA}" + Base64.encode64(Digest::SHA1.digest(plain_password + salt) + salt).chomp!
        return { 'plain' => plain_password, 'ssha' => ssha_password }
end

def usingLdap( ldap_user, ldap_password, ldap_host, ldap_port = 389,ldap_version = 3 )
        conn = LDAP::Conn.new( ldap_host, ldap_port )
        conn.set_option( LDAP::LDAP_OPT_PROTOCOL_VERSION, ldap_version )
        conn.bind( ldap_user, ldap_password )
        begin
                yield conn
        ensure
                conn.unbind
        end
end

def changePasswordInLdap( conn, uid, password_hash, user_base_dn = user_base_dn )
        entry_dn = "uid=#{uid},#{user_base_dn}"
        pw_change_mod = LDAP::Mod.new(LDAP::LDAP_MOD_REPLACE, 'userPassword', [ password_hash ])
        conn.modify( entry_dn, [ pw_change_mod ] )
end

# Possible problem if more than one entry matches, but that shouldn't happen ...
def getUserEmail( conn, uid, base_dn = base_dn)
        addr = ''
        conn.search( base_dn, LDAP::LDAP_SCOPE_SUBTREE, "(&(objectclass=inetOrgPerson)(uid=#{uid}))", ['mail'] ){|entry|
                entry.attrs.each {|attr|
                        entry.vals(attr).each {|val|
                                addr = val
                        }
                }
        }
        return addr
end

class PasswordMailer < ActionMailer::Base
        def password_message(support_email, user_email, username, password, text)
                from support_email
                recipients user_email
                subject 'New Password for Medic To Medic Knowledge Systems'
                body text
        end
end

ldap_password = ask("LDAP Password: ") {|q| q.echo = false}

usingLdap( ldap_user, ldap_password, ldap_host ) do |conn|
        ARGV.each { | username |
                password = generatePassword
                changePasswordInLdap( conn, username, password['ssha'], user_base_dn )
                email = getUserEmail( conn, username, base_dn )
                PasswordMailer.deliver_password_message( support_email, email, username, password['plain'], email_template.result(binding))
                print "username : ", username , "\n"
                print "password : ", password['plain'], "\n"
        }

end
