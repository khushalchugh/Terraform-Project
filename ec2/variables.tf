variable "image_id" {
  description = "EC2 Instance Id"
  type = string
  default = "ami-00874d747dde814fa"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"
}

variable "ec2_instance_1_tags" {
  
  description = "EC2 Instance 1 Tags"
    type = map(string)
    default = null

}

variable "ec2_instance_2_tags" {
  
  description = "EC2 Instance 2 Tags"
    type = map(string)
    default = null

}

variable "subnet_id_1" {
  description = "public subnet id 1"
  type = string

  default = null
}

variable "subnet_id_2" {
  description = "public subnet id 1"
  type = string

  default = null
}

variable "ec2_instance_security_group" {
  type = string
  description = "Bastian Host Security Group ID"
  default = null
}