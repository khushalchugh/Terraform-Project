resource "aws_vpc" "vpc_ot_microservices" {

cidr_block = var.vpc_cidr_block
tags = var.vpc_tags

}

resource "aws_internet_gateway" "internet_gateway_ot" {

  vpc_id = aws_vpc.vpc_ot_microservices.id
  tags = var.ig_tags
  
}