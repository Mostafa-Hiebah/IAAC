#create a RDS Database Instance
resource "aws_db_instance" "myinstance" {
  engine               = "mysql"
  identifier           = "myrdsinstance"
  allocated_storage    =  20
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "myrdsuser"
  password             = "myrdspassword"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.private_security_group.id ]
  db_subnet_group_name = "private_db_subnet_group"
  skip_final_snapshot  = true
  publicly_accessible =  false
  depends_on = [aws_db_subnet_group.private_db_subnet_group]
}