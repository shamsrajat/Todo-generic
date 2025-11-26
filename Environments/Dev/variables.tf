variable "resource_groups" {
  description = "Map of Resource Group to be created"
  type = map(object({
    rg_name     = string
    rg_location = string
  }))
}

variable "storage_accounts" {
  description = "Map of storage accounts to be created"
  type = map(object({
    storage_account_name     = string
    resource_group_name      = string
    storage_account_location = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "nsg" {
  description = "map of nsg details"
  type = map(object({
    nsg_name = string
    nsg_location = string
    nsg_rg_name = string
  }))
}

variable "nsg_rules" {
  description = "List of security rules for NSG"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    destination_port_range     = string
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
  type = map(string)
}

# variable "nic" {
#   description = "map of NIC"
#   type = map(object({
#     nic_name     = string
#     nic_location = string
#     nic_rg_name  = string
#   }))
# }

# variable "linux_vm" {
#   description = "map of linux vms"
#   type = map(object({
#     vm_name               = string
#     resource_group_name   = string
#     location              = string
#     size                  = string
#     admin_username        = string
#     admin_password        = string
#     network_interface_ids = list(string)
#     caching               = string
#     storage_account_type  = string
#     publisher             = string
#     offer                 = string
#     sku                   = string
#     version               = string
#   }))
# }
