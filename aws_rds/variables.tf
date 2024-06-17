variable "db_username" {
  type = string
}

variable "name" {
  type        = string
  description = "Name of the RDS database"
  default     = "dev"
}

variable "storage" {
  type        = list(number)
  description = "Storage size for RDS database"
  default     = [10, 20]
}

variable "ports" {
  type        = list(number)
  description = "List of ports opened from Private Subnets CIDR to RDS SQL Instance"
  default     = [3306, 1433]
}

variable "engine" {
  type        = list(any)
  description = "RDS engine version"
  default     = ["mysql", "sqlserver-ex", "sqlserver-web", "sqlserver-se", "sqlserver-ee"]
}

variable "engine_version" {
  type        = list(any)
  description = "MSSQL and MySQL versions"
  default     = ["8.0", "15.00.4073.23.v1"]
}

variable "instance_class" {
  type        = list(any)
  description = "Instance class for RDS database"
  default     = ["db.t3.micro", "db.t3.medium"]
}

variable "db1_param" {
  type        = string
  description = "Parameter group name for RDS database"
  default     = "default.mysql8.0"
}

variable "db2_param" {
  type        = string
  description = "Parameter group name for RDS database"
  default     = "sqlserver-ex-15.0"
}

variable "license" {
  type        = string
  description = "License model for RDS database"
  default     = "license-included"
}

variable "snapshot" {
  type        = bool
  description = "Skip final snapshot"
  default     = true
}

variable "access_db" {
  type        = bool
  description = "Access to database"
  default     = true
}

variable "storage_type" {
  type        = string
  description = "Storage type for EC2 DB Instance Connect"
  default     = "gp2"
}

variable "local_cidr" {
  type        = list(string)
  description = "CIDR block for your IP address"
  default     = ["your-ip/32"]
}

variable "db_instance_type" {
  type        = string
  description = "Types of EC2 Instances for different purposes"
  default     = "t2.micro"
}

variable "os" {
  type        = string
  description = "Operating System for EC2 DB Instance Connect"
  default     = "ubuntu"
}