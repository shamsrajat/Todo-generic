resource "azurerm_mssql_server" "sqlserver" {
  for_each = var.sqlserver

  name                         = each.value.sqlserver_name
  resource_group_name          = each.value.sql_rg_name
  location                     = each.value.sqlserver_location
  version                      = each.value.sqlserver_version
  administrator_login          = each.value.sql_admin_userid
  administrator_login_password = each.value.sql_admin_password
}

resource "azurerm_mssql_database" "sqldb" {
  for_each = var.sqldb

  name      = each.value.sqldb_name
  server_id = azurerm_mssql_server.sqlserver[each.value.server_key].id
}
