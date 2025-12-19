variable "resource_groups" {
  description = "Map of Resource Group to be created"
  type = map(object({
    rg_name     = string
    rg_location = string
  }))
}

variable "nsg" {
  description = "map of nsg details"
  type = map(object({
    nsg_name     = string
    nsg_location = string
    nsg_rg_name  = string
  }))
}

variable "nsg_rules" {
  description = "List of security rules for NSG"
  type = list(object({
    name                   = string
    priority               = number
    direction              = string
    access                 = string
    protocol               = string
    destination_port_range = string
  }))
}

variable "vnets" {
  description = "map of virtual networks"
  type = map(object({
    vnet_name     = string
    location      = string
    vnet_rg_name  = string
    address_space = list(string)
  }))
}

variable "subnets" {
  description = "map of subnet"
  type = map(object({
    subnet_name      = string
    subnet_rg        = string
    subnet_vnet_name = string
    address_prefixes = list(string)
  }))

}

variable "nsg_subnet_association" {
  description = "Map of NSG ID (key) to Subnet ID (value)"
  type        = map(string)
}

variable "linux_vms" {
  type = map(object({
    vm_name             = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    admin_password      = string

    subnet_key = string  
    private_ip = string
    public_ip_id = optional(string)

    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))
}


variable "public_ip" {
  description = "this is a map of public IP variable"
  type = map(object({
    pip_name              = string
    pip_rgname            = string
    pip_location          = string
    pip_allocation_method = string
  }))
}