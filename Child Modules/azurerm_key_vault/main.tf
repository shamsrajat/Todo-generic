resource "azurerm_key_vault" "keyvault_" {

  for_each = var.Key_vault

  name                        = each.value.kv_name
  location                    = each.value.kv_location
  resource_group_name         = each.value.kv_resource_group_name
  enabled_for_disk_encryption = each.value.kv_enabled_for_disk_encryption
  tenant_id                   = each.value.kv_tenant_id
  soft_delete_retention_days  = each.value.kv_soft_delete_retention_days
  purge_protection_enabled    = each.value.kv_purge_protection_enabled

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}