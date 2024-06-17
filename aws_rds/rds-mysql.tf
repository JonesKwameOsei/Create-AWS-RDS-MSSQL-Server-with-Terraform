# Security groups for RDS
resource "aws_security_group" "allow_mysql_sg" {
  name        = "allow_mysql"
  description = "Allow MSSQL inbound traffic"
  vpc_id      = data.aws_vpc.default.id
  depends_on  = [data.aws_vpc.default]

  ingress {
    from_port   = var.ports[0]
    to_port     = var.ports[0]
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
    Name = "${local.resource_name}-mysql-sg"
  }
}

# RDS instance using the secrets
resource "aws_db_instance" "mysql" {
  identifier           = "${var.name}-mysql"
  allocated_storage    = var.storage[0]
  storage_type         = var.storage_type
  db_name              = var.name
  engine               = var.engine[0]
  engine_version       = var.engine_version[0]
  port                 = var.ports[0]
  instance_class       = var.instance_class[0]
  username             = data.aws_secretsmanager_secret_version.db_username_version.secret_string
  password             = data.aws_secretsmanager_secret_version.db_password_version.secret_string
  parameter_group_name = var.db1_param
  skip_final_snapshot  = var.snapshot
  publicly_accessible  = var.access_db

  tags = {
    Name = "${var.name}-mysql-rds"
  }

  vpc_security_group_ids = [aws_security_group.allow_mysql_sg.id]
}