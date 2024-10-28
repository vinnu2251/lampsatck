variable "key_name" {
  description = "SSH key pair for EC2"
  default = "lamp_stack"
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "lamp_stack"  # Optional default
}

