output "ec2_public_ip" {
    value = aws_instance.my_instance[*].public_ip 
}

output "ec2_public_dns" {
    value = aws_instance.my_instance[*].public_dns
}

output "instance_details" {
  value = {
    for idx, inst in aws_instance.my_instance :
    "${terraform.workspace}-server-${idx + 1}" => {
      public_ip = inst.public_ip
      user    = "ubuntu"
    }
  }
}
