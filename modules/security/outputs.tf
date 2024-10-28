output "lamp_sg" {
  value = aws_security_group.lamp_sg.id
}

output "rds_sg" {
  value = aws_security_group.rds_sg.id
}
