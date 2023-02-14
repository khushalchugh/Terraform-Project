variable "vpc_id" {
  type = string
  description = "VPC ID"
  default = null
}

variable "nacl_tags" {
  type = map(string)
  description = "Nacl Tags"
  default = null
}

variable "rule_number" {
  type = string
  description = "Rule Number"
  default = null
}

variable "protocol" {
  type = string
  description = "Protocol"
  default = null
}

variable "rule_action" {
  type = string
  description = "Rule Action"
  default = null
}

variable "cidr_block" {
  type = string
  description = "CIDR Block"
  default = null
}

variable "from_port" {
  type = string
  description = "From Port"
  default = null
}

variable "to_port" {
  type = string
  description = "To Port"
  default = null
}

variable "subnet_id" {
  type = string
  description = "Subnet ID"
  default = null
}
