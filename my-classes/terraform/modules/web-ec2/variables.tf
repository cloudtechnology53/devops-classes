variable "region" {
  description = "Choose region for your stack"
  type        = string
  default     = "ap-south-1"
}

variable "web_ec2_count" {
  description = "Choose number ec2 instances for web"
  type        = string
  default     = "2"
}

variable "web_amis" {
  type = map
  default = {
    ap-south-1 = "ami-0e742cca61fb65051"
    us-east-1 = "ami-0cd7323ab3e63805f"
  }
}

variable "web_instance_type" {
  description = "Choose instance type for your web"
  type        = string
  default     = "t2.micro"
}

variable "web_tags" {
  type = map
  default = {
    Neme = "Webserver"
  }
}

variable "custom" {
  description = "Choose instance type for your web"
  type        = string
  default     = "b6"
}
