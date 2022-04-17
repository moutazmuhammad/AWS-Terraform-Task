# terraform {
#   backend "s3" {
#     bucket = "backendcourse-terraform"
#     key    = "backend/terraform.tfstate"
#     region = "eu-central-1"
#     dynamodb_table = "backend"
#   }
# }