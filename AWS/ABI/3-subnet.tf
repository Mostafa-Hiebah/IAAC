resource "aws_subnet" "Public_subnet" {       # for Frontend & Backend ec2
  vpc_id     = aws_vpc.hiebah_VPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "Public_subnet"
  }
}


resource "aws_subnet" "Private_subnet" {     # for db
  vpc_id     = aws_vpc.hiebah_VPC.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "Private_subnet"
  }
}


resource "aws_subnet" "Private_subnetb" {    # for db
  vpc_id     = aws_vpc.hiebah_VPC.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  
  tags = {
    Name = "Private_subnetb"
  }
}


resource "aws_db_subnet_group" "private_db_subnet_group" {      # for db
  name       = "private_db_subnet_group"
  subnet_ids = [aws_subnet.Private_subnet.id,aws_subnet.Private_subnetb.id]

  tags = {
    Name = "private_db_subnet_group"
  }
}

