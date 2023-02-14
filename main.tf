module "vpc" {
  source = "./vpc"
}

module "public-subnet" {
  source = "./subnets"
  subnets = var.public_subnets
  vpc_id = module.vpc.vpc.id
  is_public_subnet = true
}

module "private-subnet" {
  source = "./subnets"
  subnets = var.private_subnets
  vpc_id = module.vpc.vpc.id
}

module "nat-gateway-1" {
  source = "./nat_gateway"
  eip_tags = var.eip_1_tags
  subnet_id = module.public-subnet.subnet[0].id
  nat_gateway_tags = var.nat_gateway_1_tags
}

module "nat-gateway-2" {
  source = "./nat_gateway"
  eip_tags = var.eip_2_tags
  subnet_id = module.public-subnet.subnet[1].id
  nat_gateway_tags = var.nat_gateway_2_tags
}

module "route-table-public" {
  source = "./route_table_public"
  vpc_id = module.vpc.vpc.id
  internet_gateway_id = module.vpc.internet_gateway_ot.id
  subnet_id_1 = module.public-subnet.subnet[0].id
  subnet_id_2 = module.public-subnet.subnet[1].id
}

module "route-table-private" {
  source = "./route_table_private"
  vpc_id = module.vpc.vpc.id
  nat_gateway_1_id = module.nat-gateway-1.nat_gateway.id
  nat_gateway_2_id = module.nat-gateway-2.nat_gateway.id
  subnet_id_1 = module.private-subnet.subnet[0].id
  subnet_id_2 = module.private-subnet.subnet[1].id
  subnet_id_3 = module.private-subnet.subnet[2].id
  subnet_id_4 = module.private-subnet.subnet[3].id
  subnet_id_5 = module.private-subnet.subnet[4].id
  subnet_id_6 = module.private-subnet.subnet[5].id
}

module "security-group-external-load-balancer" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc.id
  inbound_ports = [3000,80,22]
  outbound_ports = [0]
  security_group_name = "external_load_balancer"
  description = "External Load Balancer"
  ingress_cidr_block = "0.0.0.0/0"
  security_group_source = false
  security_group_tags = var.external_load_balancer_security_group_tags
}
module "security-group-internal-load-balancer" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc.id
  inbound_ports = [8080,22]
  outbound_ports = [0]
  security_group_name = "internal_load_balancer"
  description = "Internal Load Balancer"
  ingress_cidr_block = false
  security_group_source = module.security-group-webserver.security_group.id
  security_group_tags = var.internal_load_balancer_security_group_tags
}
module "security-group-bastian-host" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc.id
  inbound_ports = [22,80]
  outbound_ports = [0]
  security_group_name = "bastian_host"
  description = "Bastian Host"
  ingress_cidr_block = "0.0.0.0/0"
  security_group_source = false
  security_group_tags = var.bastian_host_security_group_tags
}
module "security-group-webserver" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc.id
  inbound_ports = [3000,80,22]
  outbound_ports = [0]
  security_group_name = "webserver"
  description = "Webserver"
  ingress_cidr_block = false
  security_group_source = module.security-group-external-load-balancer.security_group.id
  security_group_tags = var.webserver_security_group_tags
}
module "security-group-attendance" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc.id
  inbound_ports = [8081,22]
  outbound_ports = [0]
  security_group_name = "attendance"
  description = "Attendance"
  ingress_cidr_block = false
  security_group_source = module.security-group-internal-load-balancer.security_group.id
  security_group_tags = var.attendance_security_group_tags
}
module "security-group-employee" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc.id
  inbound_ports = [8083,22]
  outbound_ports = [0]
  security_group_name = "employee"
  description = "Employee"
  ingress_cidr_block = false
  security_group_source = module.security-group-internal-load-balancer.security_group.id
  security_group_tags = var.employee_security_group_tags
}
module "security-group-notification" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc.id
  inbound_ports = [22,0]
  outbound_ports = [0]
  security_group_name = "notification"
  description = "Notification"
  ingress_cidr_block = false
  security_group_source = module.security-group-internal-load-balancer.security_group.id
  security_group_tags = var.notification_security_group_tags
}
module "security-group-salary" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc.id
  inbound_ports = [8080,22]
  outbound_ports = [0]
  security_group_name = "salary"
  description = "salary"
  ingress_cidr_block = false
  security_group_source = module.security-group-internal-load-balancer.security_group.id
  security_group_tags = var.salary_security_group_tags
}
module "security-group-mysql" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc.id
  inbound_ports = [3306]
  outbound_ports = [0]
  security_group_name = "mysql"
  description = "Mysql"
  ingress_cidr_block = false
  security_group_source = module.security-group-attendance.security_group.id
}
module "security-group-elasticsearch" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc.id
  inbound_ports = [9200]
  outbound_ports = [0]
  security_group_name = "elasticsearch"
  description = "Elasticsearch"
  ingress_cidr_block = false
  security_group_source = module.security-group-employee.security_group.id                       
}

module "bastian-host-instances" {
  source = "./ec2"
  subnet_id_1 = module.public-subnet.subnet[0].id
  subnet_id_2 = module.public-subnet.subnet[1].id
  ec2_instance_security_group = module.security-group-bastian-host.security_group.id
  ec2_instance_1_tags = var.bastian_host_1_tags
  ec2_instance_2_tags = var.bastian_host_2_tags
}

module "mysql-host-instances" {
  source = "./ec2"
  subnet_id_1 = module.private-subnet.subnet[4].id
  subnet_id_2 = module.private-subnet.subnet[5].id
  ec2_instance_security_group = module.security-group-mysql.security_group.id
  ec2_instance_1_tags = var.mysql_1_tags
  ec2_instance_2_tags = var.mysql_2_tags
}

module "elasticsearch-host-instances" {
  source = "./ec2"
  subnet_id_1 = module.private-subnet.subnet[4].id
  subnet_id_2 = module.private-subnet.subnet[5].id
  ec2_instance_security_group = module.security-group-elasticsearch.security_group.id
  ec2_instance_1_tags = var.elastic_search_1_tags
  ec2_instance_2_tags = var.elastic_search_2_tags
}

module "alb-external" {
  source = "./alb"
  alb_name = "alb-external"
  is_internal = false
  load_balancer_type = "application"
  subnet_id_1 = module.private-subnet.subnet[0].id
  subnet_id_2 = module.private-subnet.subnet[1].id
  alb_tags = var.external_alb_tags
  listener_protocol = "HTTP"
  listener_port = 80
  default_action_type = "forward"
  target_group_name = "external-targets"
  target_group_port = 80
  target_group_protocol = "HTTP"
  vpc_id = module.vpc.vpc.id
  alb_security_group = module.security-group-external-load-balancer.security_group.id
}

module "alb-internal" {
  source = "./alb"
  alb_name = "alb-internal"
  is_internal = true
  load_balancer_type = "application"
  subnet_id_1 = module.private-subnet.subnet[2].id
  subnet_id_2 = module.private-subnet.subnet[3].id
  alb_tags = var.external_alb_tags
  listener_protocol = "HTTP"
  listener_port = 80
  default_action_type = "forward"
  target_group_name = "internal-targets"
  target_group_port = 80
  target_group_protocol = "HTTP"
  vpc_id = module.vpc.vpc.id
  alb_security_group = module.security-group-internal-load-balancer.security_group.id
}

module "autoscaling-webserver" {
  source = "./auto_scaling"
  launch_template_name = "webserver"
  security_group = module.security-group-webserver.security_group.id
  tag_resource_type = "instance"
  launch_template_tags = var.webserver_tags
  min_size = "2"
  max_size = "5"
  desired_capacity = "2" 
  subnet_id_1 = module.private-subnet.subnet[0].id
  subnet_id_2 = module.private-subnet.subnet[1].id
  auto_scaling_group_tags = var.webserver_auto_scaling_group_tags
  scale_up_alarm_name = "scale-up-alarm-webserver"
  scale_up_comparison_operator = "GreaterThanOrEqualToThreshold"
  scale_up_evaluation_period = "2"
  scale_up_metric_name = "CPUUtilization"
  scale_up_namespace = "AWS/EC2"
  scale_up_period = "60"
  scale_up_statistic = "Average"
  scale_up_threshold = "70"
  scale_up_alarm_description = "Scaling Up of webserver"
  scale_up_policy_name = "scale-up-policy-webserver"
  scale_up_policy_type = "SimpleScaling"
  scale_up_adjustment_type = "ChangeInCapacity"
  scale_up_scaling_adjustment = "1"
  scale_up_cooldown = "300"
  scale_down_alarm_name = "scale-down-alarm-webserver"
  scale_down_comparison_operator = "LessThanThreshold"
  scale_down_evaluation_period = "2"
  scale_down_metric_name = "CPUUtilization"
  scale_down_namespace = "AWS/EC2"
  scale_down_period =  "60"
  scale_down_statistic = "Average"
  scale_down_threshold = "30"
  scale_down_alarm_description = "Scaling Down of webserver"
  scale_down_policy_name = "scale-down-policy-webserver"
  scale_down_policy_type = "SimpleScaling"
  scale_down_adjustment_type = "ChangeInCapacity"
  scale_down_scaling_adjustment = "1"
  scale_down_cooldown = "300"
}

module "autoscaling-attendance" {
source = "./auto_scaling"
launch_template_name = "attendance"
security_group = module.security-group-attendance.security_group.id
tag_resource_type = "instance"
launch_template_tags = var.attendance_tags
min_size = "2"
max_size = "5"
desired_capacity = "2" 
subnet_id_1 = module.private-subnet.subnet[2].id
subnet_id_2 = module.private-subnet.subnet[3].id
auto_scaling_group_tags = var.attendance_auto_scaling_group_tags
scale_up_alarm_name = "scale-up-alarm-attendance"
scale_up_comparison_operator = "GreaterThanOrEqualToThreshold"
scale_up_evaluation_period = "2"
scale_up_metric_name = "CPUUtilization"
scale_up_namespace = "AWS/EC2"
scale_up_period = "60"
scale_up_statistic = "Average"
scale_up_threshold = "70"
scale_up_alarm_description = "Scaling Up of attendance"
scale_up_policy_name = "scale-up-policy-attendance"
scale_up_policy_type = "SimpleScaling"
scale_up_adjustment_type = "ChangeInCapacity"
scale_up_scaling_adjustment = "1"
scale_up_cooldown = "300"
scale_down_alarm_name = "scale-down-alarm-attendance"
scale_down_comparison_operator = "LessThanThreshold"
scale_down_evaluation_period = "2"
scale_down_metric_name = "CPUUtilization"
scale_down_namespace = "AWS/EC2"
scale_down_period = "60"
scale_down_statistic = "Average"
scale_down_threshold = "30"
scale_down_alarm_description = "Scaling Down of attendance"
scale_down_policy_name = "scale-down-policy-attendance"
scale_down_policy_type = "SimpleScaling"
scale_down_adjustment_type = "ChangeInCapacity"
scale_down_scaling_adjustment = "1"
scale_down_cooldown = "300"
}

module "autoscaling-employee" {
source = "./auto_scaling"
launch_template_name = "employee"
security_group = module.security-group-employee.security_group.id
tag_resource_type = "instance"
launch_template_tags = var.employee_tags
min_size = "2"
max_size = "5"
desired_capacity = "2" 
subnet_id_1 = module.private-subnet.subnet[2].id
subnet_id_2 = module.private-subnet.subnet[3].id
auto_scaling_group_tags = var.employee_auto_scaling_group_tags
scale_up_alarm_name = "scale-up-alarm-employee"
scale_up_comparison_operator = "GreaterThanOrEqualToThreshold"
scale_up_evaluation_period = "2"
scale_up_metric_name = "CPUUtilization"
scale_up_namespace = "AWS/EC2"
scale_up_period = "60"
scale_up_statistic = "Average"
scale_up_threshold = "70"
scale_up_alarm_description = "Scaling Up of employee"
scale_up_policy_name = "scale-up-policy-employee"
scale_up_policy_type = "SimpleScaling"
scale_up_adjustment_type = "ChangeInCapacity"
scale_up_scaling_adjustment = "1"
scale_up_cooldown = "300"
scale_down_alarm_name = "scale-down-alarm-employee"
scale_down_comparison_operator = "LessThanThreshold"
scale_down_evaluation_period = "2"
scale_down_metric_name = "CPUUtilization"
scale_down_namespace = "AWS/EC2"
scale_down_period = "60"
scale_down_statistic = "Average"
scale_down_threshold = "30"
scale_down_alarm_description = "Scaling Down of employee"
scale_down_policy_name = "scale-down-policy-employee"
scale_down_policy_type = "SimpleScaling"
scale_down_adjustment_type = "ChangeInCapacity"
scale_down_scaling_adjustment = "1"
scale_down_cooldown = "300"
}

module "autoscaling-notification" {
source = "./auto_scaling"
launch_template_name = "notification"
security_group = module.security-group-notification.security_group.id
tag_resource_type = "instance"
launch_template_tags = var.notification_tags
min_size = "2"
max_size = "5"
desired_capacity = "2" 
subnet_id_1 = module.private-subnet.subnet[2].id
subnet_id_2 = module.private-subnet.subnet[3].id
auto_scaling_group_tags = var.notification_auto_scaling_group_tags
scale_up_alarm_name = "scale-up-alarm-notification"
scale_up_comparison_operator = "GreaterThanOrEqualToThreshold"
scale_up_evaluation_period = "2"
scale_up_metric_name = "CPUUtilization"
scale_up_namespace = "AWS/EC2"
scale_up_period = "60"
scale_up_statistic = "Average"
scale_up_threshold = "70"
scale_up_alarm_description = "Scaling Up of notification"
scale_up_policy_name = "scale-up-policy-notification"
scale_up_policy_type = "SimpleScaling"
scale_up_adjustment_type = "ChangeInCapacity"
scale_up_scaling_adjustment = "1"
scale_up_cooldown = "300"
scale_down_alarm_name = "scale-down-alarm-notification"
scale_down_comparison_operator = "LessThanThreshold"
scale_down_evaluation_period = "2"
scale_down_metric_name = "CPUUtilization"
scale_down_namespace = "AWS/EC2"
scale_down_period = "60"
scale_down_statistic = "Average"
scale_down_threshold = "30"
scale_down_alarm_description = "Scaling Down of notification"
scale_down_policy_name = "scale-down-policy-notification"
scale_down_policy_type = "SimpleScaling"
scale_down_adjustment_type = "ChangeInCapacity"
scale_down_scaling_adjustment = "1"
scale_down_cooldown = "300"
}

module "autoscaling-salary" {
source = "./auto_scaling"
launch_template_name = "salary"
security_group = module.security-group-salary.security_group.id
tag_resource_type = "instance"
launch_template_tags = var.salary_tags
min_size = "2"
max_size = "5"
desired_capacity = "2" 
subnet_id_1 = module.private-subnet.subnet[2].id
subnet_id_2 = module.private-subnet.subnet[3].id
auto_scaling_group_tags = var.salary_auto_scaling_group_tags
scale_up_alarm_name = "scale-up-alarm-salary"
scale_up_comparison_operator = "GreaterThanOrEqualToThreshold"
scale_up_evaluation_period = "2"
scale_up_metric_name = "CPUUtilization"
scale_up_namespace = "AWS/EC2"
scale_up_period = "60"
scale_up_statistic = "Average"
scale_up_threshold = "70"
scale_up_alarm_description = "Scaling Up of salary"
scale_up_policy_name = "scale-up-policy-salary"
scale_up_policy_type = "SimpleScaling"
scale_up_adjustment_type = "ChangeInCapacity"
scale_up_scaling_adjustment = "1"
scale_up_cooldown = "300"
scale_down_alarm_name = "scale-down-alarm-salary"
scale_down_comparison_operator = "LessThanThreshold"
scale_down_evaluation_period = "2"
scale_down_metric_name = "CPUUtilization"
scale_down_namespace = "AWS/EC2"
scale_down_period = "60"
scale_down_statistic = "Average"
scale_down_threshold = "30"
scale_down_alarm_description = "Scaling Down of salary"
scale_down_policy_name = "scale-down-policy-salary"
scale_down_policy_type = "SimpleScaling"
scale_down_adjustment_type = "ChangeInCapacity"
scale_down_scaling_adjustment = "1"
scale_down_cooldown = "300"
}

module "bastian-host-1-nacl" {
  source = "./nacl"
  vpc_id = module.vpc.vpc.id
  nacl_tags = var.nacl_tags_1
  rule_number = "100"
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  from_port = "22"
  to_port = "22"
  subnet_id = module.public-subnet.subnet[0].id
}

module "bastian-host-2-nacl" {
  source = "./nacl"
  vpc_id = module.vpc.vpc.id
  nacl_tags = var.nacl_tags_2
  rule_number = "100"
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  from_port = "22"
  to_port = "22"
  subnet_id = module.public-subnet.subnet[1].id
}

module "webserver-1-nacl" {
  source = "./nacl"
  vpc_id = module.vpc.vpc.id
  nacl_tags = var.nacl_tags_3
  rule_number = "200"
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  from_port = "22"
  to_port = "22"
  subnet_id = module.private-subnet.subnet[0].id
}

module "webserver-2-nacl" {
  source = "./nacl"
  vpc_id = module.vpc.vpc.id
  nacl_tags = var.nacl_tags_4
  rule_number = "200"
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  from_port = "22"
  to_port = "22"
  subnet_id = module.private-subnet.subnet[1].id
}

module "applications-1-nacl" {
  source = "./nacl"
  vpc_id = module.vpc.vpc.id
  nacl_tags = var.nacl_tags_5
  rule_number = "300"
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  from_port = "80"
  to_port = "443"
  subnet_id = module.private-subnet.subnet[2].id
}

module "applications-2-nacl" {
  source = "./nacl"
  vpc_id = module.vpc.vpc.id
  nacl_tags = var.nacl_tags_6
  rule_number = "300"
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  from_port = "80"
  to_port = "443"
  subnet_id = module.private-subnet.subnet[3].id
}

module "databases-1-nacl" {
  source = "./nacl"
  vpc_id = module.vpc.vpc.id
  nacl_tags = var.nacl_tags_7
  rule_number = "400"
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  from_port = "1"
  to_port = "65535"
  subnet_id = module.private-subnet.subnet[4].id
}

module "databases-2-nacl" {
  source = "./nacl"
  vpc_id = module.vpc.vpc.id
  nacl_tags = var.nacl_tags_8
  rule_number = "400"
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  from_port = "1"
  to_port = "65535"
  subnet_id = module.private-subnet.subnet[5].id
}