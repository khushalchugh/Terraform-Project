output "subnet" {
  value = [for subnets in aws_subnet.subnets: subnets]
  description = "Subnet Output"
}