data "aws_secretsmanager_secret" "db_secret" {
  name = var.db_secret_name
}

data "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = data.aws_secretsmanager_secret.db_secret.id
}

resource "aws_db_instance" "lampstack_databse" {
  allocated_storage    = 10
  storage_type        = "gp2"
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  db_name             = var.db_name
  username = jsondecode(data.aws_secretsmanager_secret_version.db_secret_version.secret_string)["username"]
  password = jsondecode(data.aws_secretsmanager_secret_version.db_secret_version.secret_string)["password"]
  db_subnet_group_name = var.db_subnet_group
  vpc_security_group_ids = [var.rds_security_group_id]

  tags = {
    Name = "LAMP-RDS"
  }

  skip_final_snapshot = true
}

