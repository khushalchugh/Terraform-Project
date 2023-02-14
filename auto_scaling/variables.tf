variable "image_id" {
  description = "EC2 Instance Id"
  type = string
  default = "ami-00874d747dde814fa"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}

variable "launch_template_name" {
  description = "Launch Template Name"
  type = string
  default = null
}
variable "security_group" {
  description = "Security Group"
  type = string
  default = null
}
variable "tag_resource_type" {
  description = "Tag Resource Type"
  type = string
  default = null
}
variable "launch_template_tags" {
  description = "Launch Template Tags"
  type = map(string)
  default = null
}
variable "min_size" {
  description = "Minimum size of templates"
  type = string
  default = null
}
variable "max_size" {
  description = "Maximum size of templates"
  type = string
  default = null
}
variable "desired_capacity" {
  description = "Desired Capacity"
  type = string
  default = null
}
variable "subnet_id_1" {
  description = "Subnet ID 1"
  type = string
  default = null
}
variable "subnet_id_2" {
  description = "Subnet ID 2"
  type = string
  default = null
}
variable "auto_scaling_group_tags" {
  description = "Auto Scaling Group Tags"
  type = map(string)
  default = null
}
variable "scale_up_alarm_name" {
  description = "Scale Up Alarm Name"
  type = string
  default = null
}
variable "scale_up_comparison_operator" {
  description = "Scale Up Comparision Operator"
  type = string
  default = null
}
variable "scale_up_evaluation_period" {
  description = "Scale Up Evaluation Period"
  type = string
  default = null
}
variable "scale_up_metric_name" {
  description = "Scale Up Metric Name"
  type = string
  default = null
}
variable "scale_up_namespace" {
  description = "Scale Up Namespace"
  type = string
  default = null
}
variable "scale_up_period" {
  description = "Scale Up Period"
  type = string
  default = null
}
variable "scale_up_statistic" {
  description = "Scale Up Statistic"
  type = string
  default = null
}
variable "scale_up_threshold" {
  description = "Scale Up Threshold"
  type = string
  default = null
}
variable "scale_up_alarm_description" {
  description = "Scale Up Description"
  type = string
  default = null
}
variable "scale_up_policy_name" {
  description = "Scale Up Policy Name"
  type = string
  default = null
}
variable "scale_up_policy_type" {
  description = "Scale Up Policy Type"
  type = string
  default = null
}
variable "scale_up_adjustment_type" {
  description = "Scale Up Adjustment Type"
  type = string
  default = null
}
variable "scale_up_scaling_adjustment" {
  description = "Scale Up Scaling Adjustment"
  type = string
  default = null
}
variable "scale_up_cooldown" {
  description = "Scale Up Cooldown"
  type = string
  default = null
}

variable "scale_down_alarm_name" {
description = "Scale Down Alarm Name"
type = string
default = null
}
variable "scale_down_comparison_operator" {
description = "Scale Down Comparision Operator"
type = string
default = null
}
variable "scale_down_evaluation_period" {
description = "Scale Down Evaluation Period"
type = string
default = null
}
variable "scale_down_metric_name" {
description = "Scale Down Metric Name"
type = string
default = null
}
variable "scale_down_namespace" {
description = "Scale Down Namespace"
type = string
default = null
}
variable "scale_down_period" {
description = "Scale Down Period"
type = string
default = null
}
variable "scale_down_statistic" {
description = "Scale Down Statistic"
type = string
default = null
}
variable "scale_down_threshold" {
description = "Scale Down Threshold"
type = string
default = null
}
variable "scale_down_alarm_description" {
description = "Scale Down Description"
type = string
default = null
}
variable "scale_down_policy_name" {
description = "Scale Down Policy Name"
type = string
default = null
}
variable "scale_down_policy_type" {
description = "Scale Down Policy Type"
type = string
default = null
}
variable "scale_down_adjustment_type" {
description = "Scale Down Adjustment Type"
type = string
default = null
}
variable "scale_down_scaling_adjustment" {
description = "Scale Down Scaling Adjustment"
type = string
default = null
}
variable "scale_down_cooldown" {
description = "Scale Down Cooldown"
type = string
default = null
}

