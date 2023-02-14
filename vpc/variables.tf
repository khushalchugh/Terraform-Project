variable "vpc_cidr_block" {
description = "vpc cidr block"
type = string
default = "10.0.0.0/24"
}

variable "vpc_tags" {
description = "vpc name"
type = map(string)
default = {
    "Name" = "vpc_ot_microservices"
}
}

variable "ig_tags" {
  description = "internet gateway"
  type = map(string)
  default = {
    "Name" = "internet_gateway_ot"
  }
}