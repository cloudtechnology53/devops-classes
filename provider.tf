provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket         = "va-b6-dev-terraform-state"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    #dynamodb_table = "javahome-tf"
  }
}
