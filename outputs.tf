output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.demo.public_ip
}

output "secret_data" {
  description = "Decoded secret from AWS Secrets Manager"
  value       = local.secret_data
  sensitive   = true
}
