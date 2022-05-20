pipeline {
  agent any
    tools {
       terraform 'terraform'
    }
    stages {
        stage('terraform format') {
            steps{
                withAWS(credentials: 'awsCredential', region: 'us-east-1') {
                sh 'terraform -chdir=./terraform fmt'
                }
            }
        }
        stage('terraform init'){
          steps{
             withAWS(credentials: 'awsCredential', region: 'us-east-1') {
                sh 'terraform -chdir=./terraform init'
                }
          }
        }
        stage('terraform plan'){
          steps{
             withAWS(credentials: 'awsCredential', region: 'us-east-1') {
               sh 'terraform -chdir=./terraform plan --var-file dev.tfvars'
             }
          }
        }
        stage('terraform build and using outputs'){
          steps{
             withAWS(credentials: 'awsCredential', region: 'us-east-1') {
                sh 'terraform -chdir=./terraform apply --auto-approve --var-file dev.tfvars '
                }
          }
        }
    }
    
}
