output "subnet_id" {
  value = aws_subnet.public_subnet_a.id  # Update if you want a specific subnet or include both
}

output "public_subnet_ids" {
  value = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]  # Added for public subnets
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "db_subnet_group" {
  value = aws_db_subnet_group.main.name  # Ensure this is the correct resource reference
}
