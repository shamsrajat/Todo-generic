variable "Key_vault" {

  description = "map of key vault details"
  type = map(object({
    kv_name                        = string
    kv_location                    = string
    kv_resource_group_name         = string
    kv_enabled_for_disk_encryption = false
    kv_tenant_id                   = data.azurerm_client_config.current.tenant_id
    kv_soft_delete_retention_days  = 0
    kv_purge_protection_enabled    = false
    }
    )
  )
}