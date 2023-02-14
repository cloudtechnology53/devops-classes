terraform {
  backend "s3" {
    bucket = "va-b6-dev-terraform-state"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "va-b6-dev-dynamoDB"
  }
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc" "va-b6-prod-vpc" {
  cidr_block       = "${var.vpc_cidr_block}"
  instance_tenancy = "default"

  tags = {
    Name = "va-b6-prod-vpc"
    Environment = "prod"
    copmany = "b6"

  }
}

output "vpc-id" {
  value = "${aws_vpc.va-b6-prod-vpc.id}"
}






