locals {
  nsg_id = values(module.nsg.nsg_ids)[0]
}

locals {
  linux_vms_resolved = {
    for k, v in var.linux_vms :
    k => merge(v, {
      subnet_id    = module.subnet.subnet_ids[v.subnet_key]
      public_ip_id = lookup(module.public_ip.public_ip_ids, k)
    })
  }
}

