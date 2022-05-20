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
               sh """
               echo "
                Host private
                    Port 22
                    HostName `terraform output private_Instace_IP`
                    User ubuntu
                    IdentityFile ~/.ssh/myKey.pem
                    StrictHostKeyChecking no
                    UserKnownHostsFile /dev/null
                    ServerAliveInterval 60
                    ServerAliveCountMax 30

                Host bastion
                    HostName `terraform output Public_Instace_IP`
                    User ubuntu
                    StrictHostKeyChecking no
                    UserKnownHostsFile /dev/null
                    IdentityFile ~/.ssh/myKey.pem " > ~/.ssh/config 

                chmod +x ~/.ssh/myKey.pem
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
