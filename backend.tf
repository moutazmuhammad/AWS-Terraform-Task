terraform {
  backend "s3" {
    bucket = "backend-course-terraform"
    key    = "backend/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "backend"
  }
}