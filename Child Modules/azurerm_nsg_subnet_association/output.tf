output "nsg_ids" {
  description = "NSG IDs"
  value = {
    for k, v in azurerm_network_security_group.nsg_child :
    k => v.id
  }
}