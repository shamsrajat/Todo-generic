resource "azurerm_network_security_group" "nsg_child_module" {
  for_each = var.nsg
  name                = each.value.nsg_name
  location            = each.value.nsg_location
  resource_group_name = each.value.nsg_rg_name

  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = "*"
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
