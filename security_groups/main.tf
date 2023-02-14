locals {
  inbound_ports = var.inbound_ports
  outbound_ports = var.outbound_ports
}


resource "aws_security_group" "security_group" {
    name = "${var.security_group_name}_security_group"
    vpc_id = var.vpc_id
    description = var.description

dynamic "ingress" {
  for_each = local.inbound_ports
  content {
    from_port = ingress.value
    to_port = ingress.value
    protocol = "tcp"
    cidr_blocks = [var.ingress_cidr_block]
    security_groups = [var.security_group_source]
  }
}

dynamic "egress" {
  for_each = local.outbound_ports
  content {
    from_port = egress.value
    to_port = egress.value
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

tags = var.security_group_tags
}
