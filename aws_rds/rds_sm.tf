# resource "aws_ssm_parameter" "db_endpoint" {
#   name  = "${local.aws_ssm_endpoint}/endpoint"
#   type  = "String"
#   value = aws_db_instance.mydb.endpoint
# }