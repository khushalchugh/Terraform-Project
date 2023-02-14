resource "aws_network_acl" "nacl" {
  vpc_id = var.vpc_id
  tags = var.nacl_tags
}


resource "aws_network_acl_rule" "nacl" {
  network_acl_id = aws_network_acl.nacl.id
  rule_number = var.rule_number
  protocol = var.protocol
  rule_action = var.rule_action
  cidr_block = var.cidr_block
  from_port = var.from_port
  to_port = var.to_port

}

resource "aws_network_acl_association" "nacl" {
  subnet_id = var.subnet_id
  network_acl_id = aws_network_acl.nacl.id
}