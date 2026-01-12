resource "aws_lb" "public_nlb" {
  name               = "public-nlb-java"
  load_balancer_type = "network"
  subnets            = aws_subnet.app_public[*].id
}
