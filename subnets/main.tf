resource "aws_subnet" "subnets" {
    
for_each = var.subnets
vpc_id = var.vpc_id
cidr_block = each.value.cidr_block
availability_zone = each.value.availability_zone
map_public_ip_on_launch = var.is_public_subnet

  tags = {
    Key = each.key
  }

}