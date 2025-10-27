output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.demo.id
}

output "secret_owner" {
  description = "Owner field retrieved from AWS Secrets Manager"
  value       = local.secret_data.username
  sensitive   = true
}
