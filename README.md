# Terraform AWS Infrastructure Project

This project implements a robust AWS infrastructure leveraging Terraform's infrastructure-as-code capabilities. Multiple AWS services are provisioned to create a high availability architecture across availability zones.

## Architecture

The key components of the infrastructure include:

- **VPC** - Virtual private cloud spanning 3 availability zones with public and private subnets
- **EC2** - Auto Scaling Groups of EC2 instances deployed across private subnets in each AZ
- **Load Balancing** - Application Load Balancer to distribute traffic across EC2 instances
- **Database** - RDS PostgreSQL instance deployed in private subnet with encryption enabled
- **Storage** - S3 bucket with versioning enabled
- **DNS** - Internal Route53 zone for private DNS resolution
- **Security** - IAM roles granting least privilege permissions and Security Groups restricting traffic

Refer to file:///home/khushal/Documents/tf/Terraform%20Project/Architecture.png![image](https://user-images.githubusercontent.com/112554837/218684208-b51cd6a2-3daf-4207-b919-06459547c503.png) for a diagram overview.

## Modules

The infrastructure is broken down into reusable, composable modules:

- `vpc` - VPC, subnets, routing tables, internet/NAT gateways
- `ec2` - EC2 instances, auto scaling, IAM roles
- `load_balancing` - Application load balancer, target groups, listeners
- `database` - RDS PostgreSQL instance and security group
- `storage` - S3 bucket with versioning
- `dns` - Internal Route53 zone and records

## Usage

To provision the infrastructure:

1. Run `terraform init` to initialize
2. Run `terraform plan` to preview resource changes
3. Run `terraform apply` to provision AWS resources
4. Run `terraform destroy` to tear down infrastructure

Proper versioning, validation, and collaboration practices are enabled through Terraform state management.

## Requirements

- AWS account with programmatic access
- Terraform v1.0+

## Outcome

This project demonstrates expertise with:

- Automated infrastructure provisioning as code
- Modular, reusable Terraform code
- Highly available and scalable AWS architecture
- A range of AWS services (EC2, VPC, RDS, S3, IAM)
- DevOps principles and tooling

Please reach out with any other questions!
