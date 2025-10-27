resource "aws_secretsmanager_secret" "demo_secret" {
  name        = var.secret_name
  description = "Demo secret created by Terraform"
}

resource "aws_secretsmanager_secret_version" "demo_secret_value" {
  secret_id     = aws_secretsmanager_secret.demo_secret.id
  secret_string = jsonencode({ password = "SuperSecret123!" })
}
