pipeline {
  agent any
  
    tools {
       terraform 'terraform'
    }

    stages {
        stage('terraform init'){
          steps{
             withAWS(credentials: 'awsCredential') {
                sh 'terraform -chdir=./terraform init'
                }
          }
        }

        stage('terraform plan'){
          steps{
             withAWS(credentials: 'awsCredential') {
               sh 'terraform -chdir=./terraform plan --var-file dev.tfvars'
             }
          }
        }

        stage('terraform build and using outputs'){
          steps{
             withAWS(credentials: 'awsCredential') {
                sh 'terraform -chdir=./terraform apply --auto-approve --var-file dev.tfvars '
                }
          }
        }

        stage('Configer IPs of public and private ec2 for inventory on master node'){
          steps{
             withAWS(credentials: 'awsCredential') {
<<<<<<< HEAD
sh 'chmod 400 ~/.ssh/privateKey.pem'

sh """
echo "Host *
    Port 22
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    ServerAliveInterval 60
    ServerAliveCountMax 30
Host bastion
    HostName `terraform -chdir=./terraform output -raw Public_Instace_IP`
    User bastion
    IdentityFile ~/.ssh/privateKey.pem
" > ~/.ssh/config 
"""

sh """
echo "[deployment]
server-a ansible_host=`terraform -chdir=./terraform output -raw private_Instace_IP` ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/privateKey.pem
[deployment:vars]
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand="ssh -W %h:%p -q bastion"' " > ansible/inventory
"""
            }
          }
        }
      
        stage('Run Ansible'){
          steps{
            withAWS(credentials: 'awsCredential') {
                sh 'ansible-playbook -i ansible/inventory ansible/playbook.yaml' 
            }
          }
        }

    }
    
}
