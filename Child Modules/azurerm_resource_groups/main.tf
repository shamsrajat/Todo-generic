resource "azurerm_resource_group" "resource_group" {
  # This is the child module for Resource Groups with for_each loop
  for_each = var.resource_groups
  name     = each.value.rg_name
  location = each.value.rg_location
}