variable "alb_name" {
  description = "ALB Name"
  type = string
  default = null
}

variable "is_internal" {
  description = "Either internal or External ALB?"
  type = bool
  default = false
}

variable "alb_security_group" {
  description = "Security Group"
  type = string
  default = null
}

variable "load_balancer_type" {
  description = "Load Balancer Type"
  type = string
  default = "application"
}

variable "subnet_id_1" {
  description = "subnet id 1"
  type = string

  default = null
}

variable "subnet_id_2" {
  description = "subnet id 1"
  type = string

  default = null
}

variable "alb_tags" {
  
  description = "ALB Tags"
    type = map(string)
    default = null

}

variable "listener_protocol" {
  description = "Protocol"
  type = string
  default = "HTTP"
}

variable "listener_port" {
  description = "port"
  type = number
  default = 80
}

variable "default_action_type" {
  description = "Default Action Type"
  type = string
  default = "forward"
}
 

variable "target_group_name" {
  description = "Target Group Name"
  type = string
  default = "default"
}
variable "target_group_port" {
  description = "Target Group Port"
  type = number
  default = 80
}
variable "target_group_protocol" {
  description = "Target Group Protocol"
  type = string
  default = "HTTP"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
  default = null
}