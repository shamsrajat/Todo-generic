module "resource_groups" {
  source          = "../../Child Modules/azurerm_resource_groups"
  resource_groups = var.resource_groups
}

module "storage_accounts" {
  source           = "../../Child Modules/azurerm_storage_account"
  storage_accounts = var.storage_accounts
  depends_on = [ module.resource_groups ]
}

module "nsg" {
  source = "../../Child Modules/azurerm_nsg"
  nsg    = var.nsg
  nsg_rules = var.nsg_rules
  depends_on = [ module.resource_groups ]
}

module "vnet" {
  source = "../../Child Modules/azurerm_vnet"
  vnet   = var.vnets
  depends_on = [ module.resource_groups ]
}

module "subnet" {
  source = "../../Child Modules/azurerm_subnet"
  subnets = var.subnets
  depends_on = [ module.vnet ]
}

module "nsg_subnet_association" {
  source = "../../Child Modules/azurerm_nsg_subnet_association"
  nsg_subnet_association = var.nsg_subnet_association
  depends_on = [ module.subnet, module.nsg ]
}
