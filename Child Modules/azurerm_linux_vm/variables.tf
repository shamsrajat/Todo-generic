variable "linux_vms" {
  type = map(object({
    vm_name             = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    admin_password      = string

    subnet_id  = string
    private_ip = string
    public_ip_id = string

    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))
}
