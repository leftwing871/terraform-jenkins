terraform {
  backend "s3" {
    region         = "ap-northeast-2"
    bucket         = "terraform-workshop-seoul-ehlee"
    key            = "example-demo.tfstate"
    dynamodb_table = "terraform-workshop-seoul-ehlee"
    encrypt        = false
  }
}

# provider "aws" {
#   region = var.region
# }
