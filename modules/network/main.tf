resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = "LAMP-VPC"
  }
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id              = aws_vpc.main.id
  cidr_block          = var.public_subnet_cidr_a
  availability_zone   = var.availability_zones[0] # Use variable for AZ
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id              = aws_vpc.main.id
  cidr_block          = var.public_subnet_cidr_b
  availability_zone   = var.availability_zones[1] # Use variable for AZ
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "public_assoc_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_assoc_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_db_subnet_group" "main" {
  name       = "lamp-db-subnet-group"
  subnet_ids = var.db_subnet_ids
  tags = {
    Name = "Lamp DB Subnet Group"
  }
}
