resource "azurerm_public_ip" "example" {

  for_each = var.public_ip

  name                = each.value.pip_name
  resource_group_name = each.value.pip_rgname
  location            = each.value.pip_location
  allocation_method   = each.value.pip_allocation_method
}