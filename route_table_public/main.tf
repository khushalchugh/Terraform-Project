resource "aws_route_table" "public" {

    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.internet_gateway_id
    }

   tags = var.route_table_public_tags
}

resource "aws_route_table_association" "public_1" {
  subnet_id = var.subnet_id_1
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id = var.subnet_id_2
  route_table_id = aws_route_table.public.id
}