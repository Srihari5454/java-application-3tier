resource "aws_vpc" "shared" {
  cidr_block           = var.shared_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = { Name = "shared-vpc" }
}

resource "aws_subnet" "db_private" {
  count             = 2
  vpc_id            = aws_vpc.shared.id
  cidr_block        = cidrsubnet(var.shared_vpc_cidr, 8, count.index)
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)
}
