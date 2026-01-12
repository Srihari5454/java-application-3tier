resource "aws_ec2_transit_gateway" "tgw" {}

resource "aws_ec2_transit_gateway_vpc_attachment" "app_attach" {
  vpc_id             = aws_vpc.app.id
  subnet_ids         = aws_subnet.app_private[*].id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "shared_attach" {
  vpc_id             = aws_vpc.shared.id
  subnet_ids         = aws_subnet.db_private[*].id
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
}
