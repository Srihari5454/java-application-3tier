variable "app_vpc_cidr" {
  default = "172.32.0.0/16"
}

variable "shared_vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "db_username" {}
variable "db_password" {
  sensitive = true
}
