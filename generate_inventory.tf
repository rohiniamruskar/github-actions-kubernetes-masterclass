locals {
  ubuntu_hosts = module.ec2.instance_details
}

resource "local_file" "ansible_inventory" {

  content = templatefile("${path.module}/templates/inventory.tpl", {
    ssh_key_path = var.ssh_key_path
    hosts        = local.ubuntu_hosts
  })

  filename = "${path.module}/ansible/inventories/${terraform.workspace}/hosts.ini"

  file_permission = "0644"
}
