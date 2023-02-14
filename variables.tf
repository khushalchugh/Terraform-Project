variable "public_subnets" {

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

variable "private_subnets" {
  type = map(map(string))

  description = "private subnets"

  default = {
    private_subnet_frontend_1 = {
      cidr_block = "10.0.0.64/27"
      availability_zone = "us-east-1a"
    },
     private_subnet_frontend_2 = {
      cidr_block = "10.0.0.96/27"
      availability_zone = "us-east-1b"
    },
     private_subnet_applications_1 = {
      cidr_block = "10.0.0.128/27"
      availability_zone = "us-east-1a"
    },
     private_subnet_applications_2 = {
      cidr_block = "10.0.0.160/27"
      availability_zone = "us-east-1b"
    },
     private_subnet_databases_1 = {
      cidr_block = "10.0.0.192/27"
      availability_zone = "us-east-1a"
    },
     private_subnet_databases_2 = {
      cidr_block = "10.0.0.224/27"
      availability_zone = "us-east-1b"
    },
  }
}

variable "nat_gateway_1_tags" {
   description = "nat gateway 1"
  type = map(string)
  default = {
    "Name" = "nat_gateway_1"
  }
}

variable "nat_gateway_2_tags" {
   description = "nat gateway 2"
  type = map(string)
  default = {
    "Name" = "nat_gateway_2"
  }
}

variable "eip_1_tags" {
   description = "eip 1"
  type = map(string)
  default = {
    "Name" = "eip_1"
  }
}

variable "eip_2_tags" {
   description = "eip 2"
  type = map(string)
  default = {
    "Name" = "eip_2"
  }
}


variable "bastian_host_1_tags" {
  
  description = "Bastian Host 1"
    type = map(string)
    default = {
      "Name" = "bastian_host_1"
  }

}

variable "bastian_host_2_tags" {
  
  description = "Bastian Host 2"
    type = map(string)
    default = {
      "Name" = "bastian_host_2"
  }

}

variable "mysql_1_tags" {
   description = "Mysql 1"
    type = map(string)
    default = {
      "Name" = "mysql_1"
  }
}

variable "mysql_2_tags" {
   description = "Mysql 2"
    type = map(string)
    default = {
      "Name" = "mysql_2"
  }
}

variable "elastic_search_1_tags" {
   description = "Elastic Search 1"
    type = map(string)
    default = {
      "Name" = "elastic_search_1"
  }
}

variable "elastic_search_2_tags" {
   description = "Elastic Search 2"
    type = map(string)
    default = {
      "Name" = "elastic_search_2"
  }
}

variable "external_alb_tags" {
  description = "External ALB"
    type = map(string)
    default = {
      "Name" = "external_alb"
  }
}

variable "webserver_tags" {
  
  description = "Webserver"
    type = map(string)
    default = {
      "Name" = "webserver"
  }

}


variable "attendance_tags" {
   description = "Attendance"
    type = map(string)
    default = {
      "Name" = "attendance"
  }
}


variable "salary_tags" {
   description = "Salary"
    type = map(string)
    default = {
      "Name" = "salary"
  }
}

variable "employee_tags" {
   description = "Employee"
    type = map(string)
    default = {
      "Name" = "employee"
  }
}

variable "notification_tags" {
   description = "Notification"
    type = map(string)
    default = {
      "Name" = "notification"
  }
}

variable "webserver_auto_scaling_group_tags" {
  description = "Webserver Auto Scaling"
    type = map(string)
    default = {
      "Name" = "webserver_auto_scaling_group_tags"
  }
}

variable "attendance_auto_scaling_group_tags" {
description = "attendance Auto Scaling"
type = map(string)
default = {
"Name" = "attendance_auto_scaling_group_tags"
}
}

variable "employee_auto_scaling_group_tags" {
description = "employee Auto Scaling"
type = map(string)
default = {
"Name" = "employee_auto_scaling_group_tags"
}
}

variable "notification_auto_scaling_group_tags" {
description = "notification Auto Scaling"
type = map(string)
default = {
"Name" = "notification_auto_scaling_group_tags"
}
}
variable "salary_auto_scaling_group_tags" {
description = "salary Auto Scaling"
type = map(string)
default = {
"Name" = "salary_auto_scaling_group_tags"
}
}

variable "nacl_tags_1" {
  description = "Bastian Host"
    type = map(string)
    default = {
      "Name" = "bastian_host_1"
  }
}
variable "nacl_tags_2" {
  description = "Bastian Host"
    type = map(string)
    default = {
      "Name" = "bastian_host_1"
  }
}
variable "nacl_tags_3" {
  description = "Webserver"
    type = map(string)
    default = {
      "Name" = "webserver_1"
  }
}
variable "nacl_tags_4" {
  description = "Webserver"
    type = map(string)
    default = {
      "Name" = "webserver_1"
  }
}
variable "nacl_tags_5" {
  description = "Applications"
    type = map(string)
    default = {
      "Name" = "applications_1"
  }
}
variable "nacl_tags_6" {
  description = "Applications"
    type = map(string)
    default = {
      "Name" = "applications_1"
  }
}
variable "nacl_tags_7" {
  description = "Databases"
    type = map(string)
    default = {
      "Name" = "databases_1"
  }
}
variable "nacl_tags_8" {
  description = "Databases"
    type = map(string)
    default = {
      "Name" = "databases_2"
  }
}


variable "external_load_balancer_security_group_tags" {
  
  description = "External Load Balancer Security Group"
    type = map(string)
    default = {
      "Name" = "external_load_balancer_security_group"
  }

}

variable "internal_load_balancer_security_group_tags" {
  
  description = "Internal Load Balancer Security Group"
    type = map(string)
    default = {
      "Name" = "external_load_balancer_security_group"
  }

}

variable "bastian_host_security_group_tags" {
  
  description = "Bastian Host Security Group"
    type = map(string)
    default = {
      "Name" = "bastian_host_security_group"
  }

}

variable "webserver_security_group_tags" {
  
  description = "Webserver Security Group"
    type = map(string)
    default = {
      "Name" = "webserver_security_group"
  }

}

variable "attendance_security_group_tags" {
  
  description = " Security Group"
    type = map(string)
    default = {
      "Name" = "attendance_security_group"
  }

}
variable "employee_security_group_tags" {
  
  description = "Employee Security Group"
    type = map(string)
    default = {
      "Name" = "employee_security_group"
  }

}
variable "notification_security_group_tags" {
  
  description = "Notification Security Group"
    type = map(string)
    default = {
      "Name" = "notification_security_group"
  }

}
variable "salary_security_group_tags" {
  
  description = "Salary Security Group"
    type = map(string)
    default = {
      "Name" = "salary_security_group"
  }

}