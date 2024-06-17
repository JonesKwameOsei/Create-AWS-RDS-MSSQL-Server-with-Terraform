########################################################################################################################
# Declaring Local resource configuration
########################################################################################################################

locals {
  name                        = format("%s-%s", var.name, "vpc")
  short_region                = "euw1"
  resource_name               = format("%s-%s", var.name, local.short_region)
  aws_secretsmanager_username = format("/%s/%s/%s", var.name, local.short_region, "username")
  aws_secretsmanager_password = format("/%s/%s/%s", var.name, local.short_region, "password")
  aws_secretsmanager_endpoint = format("/%s/%s/%s", var.name, local.short_region, "endpoint")
}