# data
data "terraform_remote_state" "vpc" {
  backend = "s3" 
  config = {
    region         = "ap-northeast-2"
    bucket         = "terraform-workshop-seoul-ehlee"
    key            = "example-demo.tfstate"
  }

}

data "aws_availability_zones" "azs" {
}

data "aws_internet_gateway" "this" {
  count = var.vpc_id != "" ? 1 : 0

  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}
