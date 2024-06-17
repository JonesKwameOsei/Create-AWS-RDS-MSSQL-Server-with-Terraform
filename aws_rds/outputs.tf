output "mssql_endpoint" {
  value = aws_db_instance.mssql.endpoint
}

output "mysql_endpoint" {
  value = aws_db_instance.mysql.endpoint
}