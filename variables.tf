variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "Amazon Machine Image ID"
  type        = string
  default     = "ami-07860a2d7eb515d9a"
}

variable "secret_name" {
  description = "Name of the secret in AWS Secrets Manager"
  type        = string
  default     = "my-demo-secret"
}

variable "secret_json" {
  description = "Optional: secret JSON from GitHub Actions if directly passed"
  type        = string
  default     = ""
  sensitive   = true
}
