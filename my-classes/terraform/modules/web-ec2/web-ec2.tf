locals {
  env_tag = {
    Environment = "${terraform.workspace}"
  }

  customer_tag = {
    custmer_name = "${var.custom}"
  }

  web_tags = "${merge(local.env_tag, local.customer_tag)}"
}

provider "aws" {
  region = "${var.region}"
}


data "aws_ami" "linux-ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
}

resource "aws_instance" "web" {
  count                  = "${var.web_ec2_count}"
  #ami                    = "${var.web_amis[var.region]}"
  ami                    = "${data.aws_ami.linux-ami.id}"
  instance_type          = "${var.web_instance_type}"
  tags                   = "${local.web_tags}"
  user_data              = "${file("scripts/apache.sh")}"
  key_name               = "${aws_key_pair.web.key_name}"
}

resource "aws_key_pair" "web" {
  key_name   = "ie-b6-dev-web-key"
  public_key = "${file("scripts/web.pub")}"
}


