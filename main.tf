terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "aws" {
  region = var.aws_region
}

# --- Retrieve secret from AWS Secrets Manager (in case you want to use it in EC2 tags or configuration)
data "aws_secretsmanager_secret" "demo_secret" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "demo_secret_version" {
  secret_id = data.aws_secretsmanager_secret.demo_secret.id
}

locals {
  # Decode secret JSON string (your secret in AWS should look like: {"username":"admin","password":"MyPass123"})
  secret_data = jsondecode(data.aws_secretsmanager_secret_version.demo_secret_version.secret_string)
}

# --- EC2 Instance ---
resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "TerraformDemo"
    Owner       = local.secret_data.username  # Example: using secret field from AWS Secrets Manager
  }
}
