resource "aws_instance" "ec2_instance_1" {
  ami = var.image_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id_1
  vpc_security_group_ids = [var.ec2_instance_security_group]

  tags = var.ec2_instance_1_tags
}

resource "aws_instance" "ec2_instance_2" {
  ami = var.image_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id_2
  vpc_security_group_ids = [var.ec2_instance_security_group]
  
  tags = var.ec2_instance_2_tags
}
