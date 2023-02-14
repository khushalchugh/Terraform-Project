output "vpc" {
  value = aws_vpc.vpc_ot_microservices
  description = "VPC"
}

output "internet_gateway_ot" {
  value = aws_internet_gateway.internet_gateway_ot
  description = "Internet Gateway"
}