#!/bin/bash
echo [slaves] > ansible/inventory
echo "server-a ansible_host=private_ip_ec2 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/newkey.pem" > serverLineFile
sed -i 's/private_ip_ec2/$(terraform output -raw public-ip-ec2)/' serverLineFile
cat serverLineFile >> ansible/inventory
echo [proxy] >> ansible/inventory
echo ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand="ssh -W %h:%p -q bastion"' >> ansible/inventory
rm serverLineFile
