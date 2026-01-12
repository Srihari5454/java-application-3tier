resource "aws_internet_gateway" "app_igw" {
  vpc_id = aws_vpc.app.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.app.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app_igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  count          = length(aws_subnet.app_public)
  subnet_id      = aws_subnet.app_public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}
