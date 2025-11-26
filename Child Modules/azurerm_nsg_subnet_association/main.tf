resource "azurerm_subnet_network_security_group_association" "assoc" {
  
  for_each = var.nsg_subnet_association

  network_security_group_id = each.key
  subnet_id                 = each.value
}