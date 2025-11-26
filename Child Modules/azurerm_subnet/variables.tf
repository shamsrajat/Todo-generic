variable "subnets" {
  description = "map of subnet"
  type = map(object({
    subnet_name      = string
    subnet_rg        = string
    subnet_vnet_name = string
    address_prefixes = list(string)
  }))

}