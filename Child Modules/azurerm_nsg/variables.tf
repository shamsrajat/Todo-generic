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
