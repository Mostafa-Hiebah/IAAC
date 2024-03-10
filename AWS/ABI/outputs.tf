output "frontend_ec2_public_ip" {
  description = "Public IP address of the Frontend_ec2 instance"
  value       = aws_instance.frontend_ec2.public_ip
}


output "Backend_ec2_public_ip" {
  description = "Public IP address of the Backend_ec2 instance"
  value       = aws_instance.Backend_ec2.public_ip
}

output "db_instance_endpoint" {
  description = "URL of the mysql instance"
  value       = aws_db_instance.myinstance.endpoint
}