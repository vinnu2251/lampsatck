variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-0866a3c8686eaeeba"  # Replace with your specific AMI ID for Ubuntu
}

variable "key_name" {
  description = "The name of your SSH key pair that will allow you to SSH into the EC2 instance"
  default     = "lamp_stack"  # Your SSH key name without the .pem extension
}

variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be deployed"
  type        = string
}

variable "ec2_security_group_id" {
  description = "The security group ID for the EC2 instance"
  type        = string
}
