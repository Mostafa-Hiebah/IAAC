resource "aws_nat_gateway" "gw_NAT" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.Public_subnet.id

  tags = {
    Name = "gw_NAT"
  }

  depends_on = [aws_internet_gateway.gateway]
}