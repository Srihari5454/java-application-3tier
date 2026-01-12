resource "aws_lb" "internal_nlb" {
  name               = "app-internal-nlb"
  load_balancer_type = "network"
  internal           = true
  subnets            = aws_subnet.app_private[*].id
}
