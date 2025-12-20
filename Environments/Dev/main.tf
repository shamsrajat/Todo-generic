module "resource_groups" {
  source          = "../../Child Modules/azurerm_resource_groups"
  resource_groups = var.resource_groups
}

module "nsg" {
  source     = "../../Child Modules/azurerm_nsg"
  nsg        = var.nsg
  nsg_rules  = var.nsg_rules
  depends_on = [module.resource_groups]
}

module "vnet" {
  source     = "../../Child Modules/azurerm_vnet"
  vnet       = var.vnets
  depends_on = [module.resource_groups]
}

module "subnet" {
  source     = "../../Child Modules/azurerm_subnet"
  subnets    = var.subnets
  depends_on = [module.vnet]
}

module "nsg_subnet_assoc" {
  source     = "../../Child Modules/azurerm_nsg_subnet_association"
  subnet_ids = module.subnet.subnet_ids
  nsg_id     = local.nsg_id
  depends_on = [ module.subnet, module.nsg ]
}

module "public_ip" {
  source     = "../../Child Modules/azurerm_public_ip"
  public_ip  = var.public_ip
  depends_on = [ module.resource_groups ]
}

module "linux_vm" {
  source    = "../../Child Modules/azurerm_linux_vm"
  linux_vms = local.linux_vms_resolved
  depends_on = [ module.subnet, module.public_ip ]
}

module "sql_server_db" {
  source = "../../Child Modules/azurerm_sql_server"
  sqlserver = var.sqlserver
  sqldb = var.sqldb
}