resource "aws_alb" "alb" {
  name = var.alb_name
  internal = var.is_internal
  load_balancer_type = var.load_balancer_type
  subnets = [var.subnet_id_1, var.subnet_id_2]  

  security_groups = [var.alb_security_group]

  tags = var.alb_tags

}

resource "aws_lb_listener" "alb" {
    load_balancer_arn = aws_alb.alb.arn
    protocol = var.listener_protocol
    port = var.listener_port

    default_action {
      type = var.default_action_type
      target_group_arn = aws_lb_target_group.alb.arn
    }

  
}

resource "aws_lb_target_group" "alb" {
  name = var.target_group_name
  port = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id = var.vpc_id

}