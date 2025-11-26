output "nsg_ids" {
  value = { for k, v in azurerm_network_security_group.nsg_child_module : k => v.id }
}