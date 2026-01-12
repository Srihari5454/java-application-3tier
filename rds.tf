resource "aws_db_subnet_group" "db_subnet" {
  subnet_ids = aws_subnet.db_private[*].id
}

resource "aws_db_instance" "mysql" {
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = var.db_username
  password                = var.db_password
  multi_az                = true
  db_subnet_group_name    = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  publicly_accessible     = false
  skip_final_snapshot     = true
}
