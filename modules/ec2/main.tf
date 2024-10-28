resource "aws_instance" "lamp" {
  ami                    = var.ami_id
  instance_type         = "t2.micro"
  subnet_id             = var.subnet_id
  vpc_security_group_ids = [var.ec2_security_group_id]
  key_name              = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2 php php-mysql libapache2-mod-php
    echo "<?php phpinfo(); ?>" > /var/www/html/index.php
    systemctl start apache2
    systemctl enable apache2
  EOF

  tags = {
    Name = "LAMP-EC2"
  }
}

output "public_ip" {
  value = aws_instance.lamp.public_ip
}
