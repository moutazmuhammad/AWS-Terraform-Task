pipeline {
  agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('terraform init'){
          steps{
             withAWS(credentials: 'awsCredential') {
                sh 'terraform init'
                }
          }
        }
        stage('terraform plan'){
          steps{
             withAWS(credentials: 'awsCredential') {
               sh 'terraform plan --var-file dev.tfvars'
             }
          }
        }
        stage('terraform build and using outputs'){
          steps{
             withAWS(credentials: 'awsCredential') {
                sh 'terraform apply --auto-approve --var-file dev.tfvars '
                }
          }
        }

        stage('Create inventory of ansible'){
          steps{
             withAWS(credentials: 'awsCredential') {
               sh 'chmod +x ./ansible/create_inventory.sh'
               sh './ansible/create_inventory.sh'
               sh 'ansible-playbook -i ansible/inventory ansible/playbook'   
              }
          }
        }
    }
    
}
