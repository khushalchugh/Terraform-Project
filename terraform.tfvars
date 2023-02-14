private_subnets = {
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


mysql_1_tags = {
  "Name" = "mysql_1"
}

mysql_2_tags = {
  "Name" = "mysql_2"
}

elastic_search_1_tags = {
  "Name" = "elastic_search_1"
}

elastic_search_2_tags = {
  "Name" = "elastic_search_2"
}

external_alb_tags = {
  "Name" = "external_alb"
}


webserver_tags = {
  "Name" = "webserver"
}

attendance_tags = {
  "Name" = "attendance"
}

salary_tags = {
  "Name" = "salary"
}

employee_tags = {
  "Name" = "employee"
}

notification_tags = {
  "Name" = "notification"
}


webserver_auto_scaling_group_tags = {
   "Name" = "webserver_auto_scaling_group"
 }
 attendance_auto_scaling_group_tags = {
   "Name" = "attendance_auto_scaling_group"
 }
 salary_auto_scaling_group_tags = {
   "Name" = "attendance_auto_scaling_group"
 }
 notification_auto_scaling_group_tags = {
   "Name" = "attendance_auto_scaling_group"
 }
 employee_auto_scaling_group_tags = {
   "Name" = "attendance_auto_scaling_group"
 }

nacl_tags_1 = {
  "Name" = "bastian_host_1"
}
nacl_tags_2 = {
  "Name" = "bastian_host_2"
}
nacl_tags_3 = {
  "Name" = "webserver_1"
}
nacl_tags_4 = {
  "Name" = "valwebserver_2"
}
nacl_tags_5 = {
  "Name" = "applications_1"
}
nacl_tags_6 = {
  "Name" = "applications_2"
}
nacl_tags_7 = {
  "Name" = "databases_1"
}
nacl_tags_8 = {
  "Name" = "databases_2"
}



external_load_balancer_security_group_tags = {
  "Name" = "external_load_balancer_security_group"
}

internal_load_balancer_security_group_tags = {
  "Name" = "internal_load_balancer_security_group"
}

bastian_host_security_group_tags = {
  "Name" = "bastian_host_security_group"
}
webserver_security_group_tags = {
  "Name" = "webserver_security_group"
}

attendance_security_group_tags = {
  "Name" = "attendance_security_group"
}

employee_security_group_tags = {
  "Name" = "employee_security_group"
}
notification_security_group_tags = {
  "Name" = "notification_security_group"
}
salary_security_group_tags = {
  "Name" = "salary_security_group"
}
