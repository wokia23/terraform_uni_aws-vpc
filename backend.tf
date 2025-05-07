terraform {
  backend "s3" {
    bucket         = "rowacday"
    key            = "networking/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform_aws-networking_state_lock"
    
  }
}