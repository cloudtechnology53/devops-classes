
provider "aws" {
  region = "${var.region}"
}


module "web-ec2" {

  source = "../../modules/web-ec2"

  region = "ap-south-1"
  web_ec2_count = "2"
  web_instance_type = "t2.micro"
  custom = "b6"

}






