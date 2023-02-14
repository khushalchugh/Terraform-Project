variable "eip_tags" {
   description = "eip"
  type = map(string)
  default = {
    "Name" = "eip"
  }
}

variable "nat_gateway_tags" {
   description = "nat gateway"
  type = map(string)
  default = {
    "Name" = "nat_gateway"
  }
}

variable "subnet_id" {
  description = "Subnet Id"
  type = string

  default = null
}