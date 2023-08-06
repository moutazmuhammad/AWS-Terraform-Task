resource "aws_instance" "public1" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.public_access.id]
  subnet_id              = module.network.public_subnet1
  key_name               = "privatekey"
  tags = {
    Name = "ec2-public-1"
  }
  provisioner "local-exec" { # excute only with first creation
    command = "echo ${self.public_ip} >> random"
  }

}

resource "aws_instance" "private1" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.private_access.id]
  subnet_id                   = module.network.private_subnet1
  associate_public_ip_address = false # to privent public ip
  key_name                    = "privatekey"
  tags = {
    Name = "ec2-private-1"
  }
  

}

# resource "aws_instance" "private2" {
#   ami           = "ami-0e8cb4bdc5bb2e6c0"
#   instance_type = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.private_access.id]
#   subnet_id = aws_subnet.private-two.id
#   tags = {
#       Name = "ec2-private-2"
#   }
# user_data = file("private.sh")
# user_data = <<-EOF
#               #!/bin/bash
#                 sudo apt update -y
#                 sudo apt install -y nginx
#                 sudo systemctl start nginx
#                 sudo systemctl enable nginx
#                 sudo chmod 777 /var/www/html/index.nginx-debian.html
#                 echo "The page was created by the user data by Moutaz Muhammad" > /var/www/html/index.nginx-debian.html
# EOF
# }



# resource "aws_instance" "public2" {
#   ami           = "ami-0e8cb4bdc5bb2e6c0"
#   instance_type = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.public_access.id]
#   subnet_id = aws_subnet.public-two.id
#   tags = {
#       Name = "ec2-public-2"
#   }
# user_data = file("init.sh")
# }
