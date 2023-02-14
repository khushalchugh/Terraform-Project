resource "aws_route_table" "private_1" {

    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.nat_gateway_1_id
    }

    tags = var.route_table_private_tags
}

resource "aws_route_table" "private_2" {

    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.nat_gateway_2_id
    }

    tags = var.route_table_private_2_tags
}


locals {
 subnet_ids_private_1 = {
    "private_subnet_frontend_1" = var.subnet_id_1,
    "private_subnet_applications_1" = var.subnet_id_2,
    "private_subnet_databases_1" = var.subnet_id_3
  }

  subnet_ids_private_2 = {
    "private_subnet_frontend_2" = var.subnet_id_4,
    "private_subnet_applications_2" = var.subnet_id_5,
    "private_subnet_databases_2" = var.subnet_id_6
  }
}

resource "aws_route_table_association" "private_1" {
for_each = local.subnet_ids_private_1
subnet_id = each.value
route_table_id = aws_route_table.private_1.id
}

resource "aws_route_table_association" "private_2" {
for_each = local.subnet_ids_private_2
subnet_id = each.value
route_table_id = aws_route_table.private_2.id
}

