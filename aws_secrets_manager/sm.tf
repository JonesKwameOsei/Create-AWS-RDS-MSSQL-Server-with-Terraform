# Creating db secrets with secret manager
resource "aws_secretsmanager_secret" "db_password" {
  name = "${local.aws_secretsmanager_password}/password"
}

resource "aws_secretsmanager_secret_version" "db_password_version" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = var.db_password
}

resource "aws_secretsmanager_secret" "db_username" {
  name = "${local.aws_secretsmanager_username}/username"
}

resource "aws_secretsmanager_secret_version" "db_username_version" {
  secret_id     = aws_secretsmanager_secret.db_username.id
  secret_string = var.db_username
}