variable "db_name" {
  description = "The name of the database"
  type        = string
  default = "lamp_stack"
}

variable "db_secret_name" {
  description = "The name of the Secrets Manager secret that contains the DB credentials"
  type        = string
}

variable "db_subnet_group" {
  description = "The name of the DB subnet group"
  type        = string
}

variable "rds_security_group_id" {
  description = "The security group ID for the RDS instance"
  type        = string
}
