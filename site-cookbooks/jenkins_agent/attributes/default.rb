
set_unless[:jenkins_agent][:server_url] = "http://hudson-01.map-cloud-01.eu:8080/hudson"
set_unless[:jenkins_agent][:home_dir] = "/var/jenkins-agent"

set_unless[:jenkins_agent][:user] = "jenkins"
set_unless[:jenkins_agent][:group] = "jenkins"


if attribute?("ec2")
  if attribute[:ec2][:instance_type] == "t1.micro"
    set[:jenkins_agent][:jvm][:java_opts] = "-server -Xmx64m -Djava.awt.headless=true"
  elsif attribute[:ec2][:instance_type] == "m1.large"
    set[:jenkins_agent][:jvm][:java_opts] = "-server -Xmx512m -XX:MaxPermSize=256m -Djava.awt.headless=true"
  end
end

set_unless[:jenkins_agent][:jvm][:java_opts] = "-server -Xmx256m -Xms256m -Djava.awt.headless=true"