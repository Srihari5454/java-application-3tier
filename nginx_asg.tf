resource "aws_launch_template" "nginx" {
  image_id               = "ami-0c02fb55956c7d316"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]

  user_data = base64encode(<<EOF
#!/bin/bash
yum install -y nginx
systemctl start nginx
EOF
)
}

resource "aws_autoscaling_group" "nginx_asg" {
  min_size            = 2
  max_size            = 4
  desired_capacity    = 2
  vpc_zone_identifier = aws_subnet.app_public[*].id

  launch_template {
    id      = aws_launch_template.nginx.id
    version = "$Latest"
  }
}
