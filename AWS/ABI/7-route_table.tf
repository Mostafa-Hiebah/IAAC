resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.hiebah_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags = {
    Name = "public_route_table"
  }
}



resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.hiebah_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw_NAT.id
  }

  tags = {
    Name = "private_route_table"
  }
}



#########################################

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.Public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.Private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}