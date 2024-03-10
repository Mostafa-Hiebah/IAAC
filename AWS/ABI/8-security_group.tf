resource "aws_security_group" "public_security_group" {
  name = "public_security_group"
  description = "Allow SSH traffic on public"
  vpc_id = aws_vpc.hiebah_VPC.id


  ingress {
    description = "allow ssh "
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]    # who will connect ... any one
  }

  ingress {
    description = "allow icmp "
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]    # who will connect ... any one
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"      # any protocol/ all type of traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "public_security_group"
  }
}








resource "aws_security_group" "private_security_group" {
  name = "private_security_group"
  description = "Allow SSH traffic on private"
  vpc_id = aws_vpc.hiebah_VPC.id


  ingress {
    description = "allow connection to mysql "
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = [aws_vpc.hiebah_VPC.cidr_block]   # who will connect .. any resource inside vpc
  }


  ingress {
    description = "allow ssh "
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.hiebah_VPC.cidr_block]    # who will connect .. any resource inside vpc
  }

  ingress {
    description = "allow icmp "
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = [aws_vpc.hiebah_VPC.cidr_block]    # who will connect .. any resource inside vpc
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"      # any protocol/ all type of traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "private_security_group"
  }
}