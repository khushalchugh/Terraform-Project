variable "subnets" {

  description = "public subnets"
  type = map(map(string))

  default = {
    public_subnet_1 = {
      cidr_block = "10.0.0.0/27"
      availability_zone = "us-east-1a"
    },
    public_subnet_2 = {
       cidr_block = "10.0.0.32/27"
      availability_zone = "us-east-1b"
    }
  }

}

variable "vpc_id" {
  type = string
  description = "VPC ID"
  default = null
}

variable "is_public_subnet" {
  type = bool
  description = "Subnet Type"
  default = false

}