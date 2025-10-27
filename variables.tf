variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-07860a2d7eb515d9a"
}

variable "secret_name" {
  description = "Name of the AWS Secrets Manager secret"
  default     = "my-demo-secret"
}
