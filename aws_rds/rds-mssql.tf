# Security groups for RDS
resource "aws_security_group" "allow_mssql_sg" {
  name        = "allow_mssql"
  description = "Allow MSSQL inbound traffic"
  vpc_id      = data.aws_vpc.default.id
  depends_on  = [data.aws_vpc.default]

  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = var.local_cidr # limiting the IP range to my ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.resource_name}-mssql-sg"
  }
}

#   resource "aws_security_group_rule" "allow_mssql_ingress" {
#   type              = "ingress"
#   from_port         = 1433
#   to_port           = 1433
#   protocol          = "tcp"
#   cidr_blocks       = var.ip_cidr[0]  # Be cautious with this setting, better to limit the IP range
#   security_group_id = aws_security_group.allow_mssql.id
# }

# resource "aws_security_group_rule" "allow_mssql_egress" {
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.allow_mssql.id
# }

# RDS instance using the secrets
# RDS instance using the secrets
# resource "aws_db_instance" "mssql" {
#   identifier           = "${var.name}-mssql"
#   allocated_storage    = var.storage[1]
#   storage_type         = var.storage_type
#   db_name              = var.name
#   engine               = "sqlserver-se"
#   engine_version       = "15.00.4043.16.v1"  # Use the correct engine version
#   port                 = var.ports[1]
#   instance_class       = "db.t3.medium"  # Change to a supported instance class
#   username             = data.aws_secretsmanager_secret_version.db_username_version.secret_string
#   password             = data.aws_secretsmanager_secret_version.db_password_version.secret_string
#   parameter_group_name = var.db2_param
#   skip_final_snapshot  = var.snapshot
#   publicly_accessible  = var.access_db
#   license_model        = "license-included"  # License model


resource "aws_db_instance" "mssql" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "sqlserver-ex"
  engine_version       = "15.00.4073.23.v1"
  # family               = "sqlserver-ex-15.0"
  # major_engine_version = "15.00"
  instance_class       = "db.t3.medium"
  db_name              = null
  username             = data.aws_secretsmanager_secret_version.db_username_version.secret_string
  password             = data.aws_secretsmanager_secret_version.db_password_version.secret_string
  skip_final_snapshot  = var.snapshot   
  publicly_accessible  = var.access_db
  license_model        = "license-included"


  multi_az             = false

  tags = {
    Name = "${var.name}-mssql-rds"
  }


  vpc_security_group_ids = [aws_security_group.allow_mssql_sg.id]
}
