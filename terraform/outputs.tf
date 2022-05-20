output "Public_Instace_IP" {
  value = aws_instance.public1.public_ip
}

output "private_Instace_IP" {
  value = aws_instance.private1.private_ip
}


# terraform  output -raw private_Instace_IP

# sed -i "s#.*ansible_host=.*#ansible_host: $(terraform output -raw public-ip-ec2 )#" ./ansible/group_vars/proxy.yaml 

# server-a ansible_host=private_ip_ec2 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/newkey.pem