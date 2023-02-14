variable "inbound_ports" {
  description = "Inbound Ports"
  type = list(number)
  default = [ 0 ]
}

variable "outbound_ports" {
  description = "Outbound Ports"
  type = list(number)
  default = [ 0 ]
}

variable "security_group_name" {
  description = "Security Group Name"
  type = string
  default = null
}

variable "description" {
  description = "Description"
  type = string
  default = null
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
  default = null
}

variable "security_group_source" {
  type = string
  description = "Security Group Source"
  default = null  
}


variable "ingress_cidr_block" {
  type = string
  description = "Ingress CIDR Block"
  default = null  
}

variable "security_group_tags" {
  type = map(string)
  description = "Security Group Tags"
  default = null  
}
