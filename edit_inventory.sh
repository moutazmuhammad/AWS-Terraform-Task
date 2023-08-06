
sed -i "s#.*ansible_host.*#server-a ansible_host=$(terraform -chdir=./terraform  output -raw private_Instace_IP) ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/privateKey.pem#" /var/jenkins_home/workspace/terraform/ansible/inventory
