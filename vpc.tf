# main.tf
provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "example" {
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "public_1" {
  cidr_block = "${var.public_subnet_cidr_1}"
  vpc_id     = "${aws_vpc.example.id}"

  tags = {
    Name = "example-public-subnet-1"
  }
}

resource "aws_subnet" "public_2" {
  cidr_block = "${var.public_subnet_cidr_2}"
  vpc_id     = "${aws_vpc.example.id}"

  tags = {
    Name = "example-public-subnet-2"
  }
}

resource "aws_subnet" "private_1" {
  cidr_block = "${var.private_subnet_cidr_1}"
  vpc_id     = "${aws_vpc.example.id}"

  tags = {
    Name = "example-private-subnet-1"
  }
}

resource "aws_subnet" "private_2" {
  cidr_block = "${var.private_subnet_cidr_2}"
  vpc_id     = "${aws_vpc.example.id}"

  tags = {
    Name = "example-private-subnet-2"
  }
}
