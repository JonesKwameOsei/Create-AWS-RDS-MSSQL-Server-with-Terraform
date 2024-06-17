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


resource "aws_db_instance" "mssql" {
  identifier           = "${var.name}-mssql"
  allocated_storage    = var.storage[1]
  storage_type         = var.storage_type
  engine               = var.engine[1]
  engine_version       = var.engine_version[1]
  instance_class       = var.instance_class[1]
  db_name              = null
  username             = data.aws_secretsmanager_secret_version.db_username_version.secret_string
  password             = data.aws_secretsmanager_secret_version.db_password_version.secret_string
  skip_final_snapshot  = var.snapshot   
  publicly_accessible  = var.access_db
  license_model        = var.license


  multi_az             = false

  tags = {
    Name = "${var.name}-mssql-rds"
  }


  vpc_security_group_ids = [aws_security_group.allow_mssql_sg.id]
}
