provider "aws" {
  region = "us-east-1"  # Change to your desired region
}

module "network" {
  source              = "./modules/network"
  db_subnet_ids      = module.network.public_subnet_ids  # Use public subnet IDs for DB
  availability_zones  = ["us-east-1a", "us-east-1b"]  # Provide AZs if needed
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
}

module "ec2" {
  source                = "./modules/ec2" # Specify if needed
  key_name              = var.key_name
  subnet_id             = module.network.public_subnet_ids[0]  # Use the first public subnet
  ec2_security_group_id = module.security.lamp_sg
}

module "rds" {
  source                = "./modules/rds"
  db_secret_name       = "lampstack-db-credentials"   # Change this to your secret name
  db_subnet_group      = module.network.db_subnet_group  # Update with appropriate subnet group
  rds_security_group_id = module.security.rds_sg
  db_name              = var.db_name  # Pass the database name
}
