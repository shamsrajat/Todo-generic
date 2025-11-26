variable "nic" {
  description = "map of NIC"
  type = map(object({
    nic_name     = string
    nic_location = string
    nic_rg_name  = string
  }))
}

variable "linux_vm" {
  description = "map of linux vms"
  type = map(object({
    vm_name               = string
    resource_group_name   = string
    location              = string
    size                  = string
    admin_username        = string
    admin_password        = string
    network_interface_ids = list(string)
    caching               = string
    storage_account_type  = string
    publisher             = string
    offer                 = string
    sku                   = string
    version               = string
  }))
}
