resource "azurerm_key_vault_secret" "kv_secret_child" {

  for_each = var.kv_secret

  name         = each.value.kv_secret_name
  value        = each.value.kv_secret_value
  key_vault_id = azurerm_key_vault.example.id
}