output "eip" {
  value = aws_eip.eip
  description = "Elastic Ip"
}

output "nat_gateway" {
  value = aws_nat_gateway.nat_gateway
  description = "Nat Gateway"
}