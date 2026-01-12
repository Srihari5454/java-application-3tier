resource "aws_launch_template" "tomcat" {
  image_id               = "ami-0c02fb55956c7d316"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.tomcat_sg.id]

  user_data = base64encode(<<EOF
#!/bin/bash
yum install -y java-17 git maven tomcat
cd /opt
git clone https://github.com/NotHarshhaa/DevOps-Projects.git
cd DevOps-Projects/DevOps-Project-01
mvn clean package
cp target/*.war /var/lib/tomcat/webapps/
systemctl start tomcat
EOF
)
}

resource "aws_autoscaling_group" "tomcat_asg" {
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2
  vpc_zone_identifier = aws_subnet.app_private[*].id

  launch_template {
    id      = aws_launch_template.tomcat.id
    version = "$Latest"
  }
}
