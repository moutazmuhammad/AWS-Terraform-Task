# resource "tls_private_key" "private_key_pair" { # has public key and private key
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }
# # ============================================================================
# resource "aws_key_pair" "public_key_pair" { # to get public key from tls_private_key
#   key_name   = "mypublic-key_pair"
#   public_key = tls_private_key.private_key_pair.public_key_openssh
# }

# # ============================================================================

# resource "aws_secretsmanager_secret" "private_key" {
#   name                    = "my_privateKey"
#   recovery_window_in_days = 0 # to force deletion without recovery
# }

# resource "aws_secretsmanager_secret_version" "private_key_value" {
#   secret_id     = aws_secretsmanager_secret.private_key.id
#   secret_string = tls_private_key.private_key_pair.private_key_pem
# }

# # ============================================================================

# resource "aws_secretsmanager_secret" "public_key" {
#   name                    = "my_publickey"
#   recovery_window_in_days = 0 # to force deletion without recovery
# }

# resource "aws_secretsmanager_secret_version" "public_key_value" {
#   secret_id     = aws_secretsmanager_secret.public_key.id
#   secret_string = aws_key_pair.public_key_pair.public_key
# }


# # commands:
# # aws secretsmanager get-secret-value --secret-id my_privateKey --query 'SecretString' --region "eu-west-2" --output text > key.pem
# # chmod 400 key.pem
# # ssh-add -k key.pem 
# # ssh  -A ec2-user@ip-of-bastion
# # ssh private-ip-of-private-instance


resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "myKey"       # Create "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create "myKey.pem" to your Master Node!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ~/.ssh/myKey.pem"
  }
}