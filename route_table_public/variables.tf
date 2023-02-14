variable "internet_gateway_id" {
  type = string
  description = "Internet Gateway ID"
  default = null
}

variable "route_table_public_tags" {
  description = "route_table_public"
  type = map(string)
  default = {
    "Name" = "route_table_public"
  }
}


variable "subnet_id_1" {
  description = "public subnet id 1"
  type = string

  default = null
}

variable "subnet_id_2" {
  description = "public subnet id 1"
  type = string

  default = null
}


variable "vpc_id" {
  type = string
  description = "VPC ID"
  default = null
}

