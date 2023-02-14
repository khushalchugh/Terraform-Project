resource "aws_eip" "eip" {
  vpc = true
  
    tags = var.eip_tags

}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.subnet_id
  
  tags = var.nat_gateway_tags

}