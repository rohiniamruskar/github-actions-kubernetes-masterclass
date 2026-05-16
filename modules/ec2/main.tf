
# key value pair

resource "aws_key_pair" "my-key-pair" {
  key_name   ="${var.env}-three-tier-app-key"   # dev-three-tier-app-key
  public_key = file("././three-tier-app-key.pub")
}


# VPC Default

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}


# Security Group

resource "aws_security_group" "my_security_group" {

  name        = "${var.env}-three-tier-app-sg" 
  vpc_id      = aws_default_vpc.default.id # interpolation
  description = "this is Inbound and outbound rule for instance security group"

}

# Inbound rule

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# Outbound Rule

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.my_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# EC2 Instance

resource "aws_instance" "my_instance" {

  count = var.ec2_instance_count
  
  ami = var.ec2_ami_id                    # OS AMI ID

  instance_type = var.ec2_instance_type    # instance type

  key_name = aws_key_pair.my-key-pair.key_name   # key pair

  vpc_security_group_ids = [aws_security_group.my_security_group.id]   # VPC and security group
  associate_public_ip_address = true

  # root storage (EBS)

  root_block_device {
    volume_size = var.ec2_volume_size
    volume_type = "gp3"
  }
  tags = {
    Name = "${var.env}-${var.ec2_instance_name}"     # Instance name
    Enviroment = var.env
  }

}

#resource "aws_ec2_instance_state" "my_instance_state" {
  
 # instance_id = aws_instance.my_instance[*].id
 # state = var.ec2_instance_state
#}
