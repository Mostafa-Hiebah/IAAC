data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "frontend_ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"    # 1 VCPU & 1GB RAM
  subnet_id     = aws_subnet.Public_subnet.id
  vpc_security_group_ids =[aws_security_group.public_security_group.id ]
  key_name = aws_key_pair.tf_public_key_pair.id    # put public key inside ec2

  tags = {
    Name = "frontend_ec2"
  }
}




resource "aws_instance" "Backend_ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"    # 1 VCPU & 1GB RAM
  subnet_id     = aws_subnet.Public_subnet.id
  vpc_security_group_ids =[aws_security_group.public_security_group.id ]
  key_name = aws_key_pair.tf_public_key_pair.id    # put public key inside ec2

  tags = {
    Name = "Backend_ec2"
  }
}




