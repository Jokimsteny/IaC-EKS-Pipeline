terraform {
  backend "s3" {
    bucket         = "terraform-state-iac-pipeline"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}
