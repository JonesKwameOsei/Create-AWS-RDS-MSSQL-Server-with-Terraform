# Fetch resource for VPC
data "aws_vpc" "default" {
  default = true
}

# Fetch existing resources from Secret manager
data "aws_secretsmanager_secret" "db_password" {
  name = "/dev_db/euw1/password/password"
}

data "aws_secretsmanager_secret_version" "db_password_version" {
  secret_id = data.aws_secretsmanager_secret.db_password.id
}

data "aws_secretsmanager_secret" "db_username" {
  name = "/dev_db/euw1/username/username"
}

data "aws_secretsmanager_secret_version" "db_username_version" {
  secret_id = data.aws_secretsmanager_secret.db_username.id
}



