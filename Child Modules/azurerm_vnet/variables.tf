variable "vnet" {
  description = "map of vnets"
  type = map(object({
    vnet_name     = string
    location      = string
    vnet_rg_name  = string
    address_space = list(string)
  }))

}