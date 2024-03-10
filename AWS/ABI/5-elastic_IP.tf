resource "aws_eip" "elastic_ip" {
  domain   = "vpc"
  
    tags = {
    Name = "elastic_ip"      
  }
}