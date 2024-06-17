variable "db_password" {
  type = string
}

variable "name" {
  type        = string
  description = "Database name"
  default     = "dev_db"
}

variable "db_username" {
  description = "database user name"
  type        = string
}