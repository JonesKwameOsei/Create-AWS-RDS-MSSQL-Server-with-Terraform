module "secrets_manager" {
  source      = "./aws_secrets_manager"
  db_password = var.db_password
  db_username = var.db_username
}

module "rds_database" {
  source      = "./aws_rds"
  db_username = var.db_username
}

