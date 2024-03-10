resource "aws_instance" "frontend_ec2" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"    # 1 VCPU & 1GB RAM
  subnet_id     = aws_subnet.Public_subnet.id
  vpc_security_group_ids =[aws_security_group.public_security_group.id ]
  key_name = aws_key_pair.tf_public_key_pair.id    # put public key inside ec2

  tags = {
    Name = "frontend_ec2"
  }
}




resource "aws_instance" "Backend_ec2" {
  ami           = "ami-0f34c5ae932e6f0e4"
  instance_type = "t2.micro"    # 1 VCPU & 1GB RAM
  subnet_id     = aws_subnet.Public_subnet.id
  vpc_security_group_ids =[aws_security_group.public_security_group.id ]
  key_name = aws_key_pair.tf_public_key_pair.id    # put public key inside ec2

  tags = {
    Name = "Backend_ec2"
  }
}




