resource "azurerm_virtual_network" "vnet_child_module" {

  for_each = var.vnet

  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.vnet_rg_name
  address_space       = each.value.address_space
}