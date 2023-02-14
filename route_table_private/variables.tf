variable "vpc_id" {
  type = string
  description = "VPC ID"
  default = null
}

variable "nat_gateway_1_id" {
  type = string
  description = "NAT Gateway"
  default = null
}

variable "nat_gateway_2_id" {
  type = string
  description = "NAT Gateway"
  default = null
}

variable "route_table_private_tags" {
  description = "route table for private subnets"
  type = map(string)
  default = {
    "Name" = "route_table_private"
  }
}

variable "route_table_private_2_tags" {
  description = "route table for private subnets 2"
  type = map(string)
  default = {
    "Name" = "route_table_private_2"
  }
}

variable "subnet_id_1" {
  description = "Subnet ID"
  type = string
  default = null
}
variable "subnet_id_2" {
  description = "Subnet ID"
  type = string
  default = null
}
variable "subnet_id_3" {
  description = "Subnet ID"
  type = string
  default = null
}
variable "subnet_id_4" {
  description = "Subnet ID"
  type = string
  default = null
}
variable "subnet_id_5" {
  description = "Subnet ID"
  type = string
  default = null
}
variable "subnet_id_6" {
  description = "Subnet ID"
  type = string
  default = null
}
