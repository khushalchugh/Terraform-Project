resource "aws_launch_template" "template" {
  name = var.launch_template_name
  image_id = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.security_group]

   lifecycle {
    create_before_destroy = true
  }

    tag_specifications {
    resource_type = var.tag_resource_type
    tags = var.launch_template_tags
  }
  
}



resource "aws_autoscaling_group" "template" {

  launch_template {
    id = aws_launch_template.template.id
  }
  
  min_size = var.min_size
  max_size = var.max_size
  desired_capacity = var.desired_capacity
  vpc_zone_identifier = [var.subnet_id_1, var.subnet_id_2]

   tags = [var.auto_scaling_group_tags]          

}


resource "aws_cloudwatch_metric_alarm" "scale_up" {
  alarm_name = var.scale_up_metric_name
  comparison_operator = var.scale_up_comparison_operator
  evaluation_periods = var.scale_up_evaluation_period
  metric_name = var.scale_up_metric_name
  namespace = var.scale_up_namespace
  period = var.scale_up_period
  statistic = var.scale_up_statistic
  threshold = var.scale_up_threshold
  alarm_description = var.scale_up_alarm_description
  alarm_actions =   [aws_autoscaling_policy.scale_up.arn]

}

resource "aws_autoscaling_policy" "scale_up" {
  name = var.scale_up_policy_name
  autoscaling_group_name = aws_autoscaling_group.template.name
  policy_type = var.scale_up_policy_type
  adjustment_type = var.scale_up_adjustment_type
  scaling_adjustment = var.scale_up_scaling_adjustment
  cooldown = var.scale_up_cooldown
}

resource "aws_cloudwatch_metric_alarm" "scale_down" {
alarm_name = var.scale_down_metric_name
comparison_operator = var.scale_down_comparison_operator
evaluation_periods = var.scale_down_evaluation_period
metric_name = var.scale_down_metric_name
namespace = var.scale_down_namespace
period = var.scale_down_period
statistic = var.scale_down_statistic
threshold = var.scale_down_threshold
alarm_description = var.scale_down_alarm_description
alarm_actions = [aws_autoscaling_policy.scale_down.arn]
}

resource "aws_autoscaling_policy" "scale_down" {
name = var.scale_down_policy_name
autoscaling_group_name = aws_autoscaling_group.template.name
policy_type = var.scale_down_policy_type
adjustment_type = var.scale_down_adjustment_type
scaling_adjustment = var.scale_down_scaling_adjustment
cooldown = var.scale_down_cooldown
}
