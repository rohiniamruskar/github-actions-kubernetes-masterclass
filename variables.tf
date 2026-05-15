# values can be changed in runtime/ values are availabe throughout the folder

variable "ec2_instance_name" {
 description = "This variable holds EC2 instance name"
 default = "three-tier-app-server"
 type = string
  
}

variable "ec2_volume_size" {
 description = "This variable holds EC2 instance volume size"
 default = 20
 type = number
  
}

variable "ec2_instance_state" {
 description = "This variable holds EC2 instance state"
 default = "running"
 type = string
  
}

variable "ec2_ami_id" {
 description = "This variable holds EC2 AMI ID"
 default = "ami-0d13e2317a7e75c95"
 type = string
  
}
variable "ec2_instance_type" {
 description = "This variable holds EC2 instance type"
 default = "t3.medium" 
 type = string
  
}
variable "ec2_instance_count" {
 description = "This variable holds EC2 instance count"
 default = 1
 type = number
  
}

variable "env" {
 description = "This variable holds the enviroment"
 default = "dev"
 type = string
  
}