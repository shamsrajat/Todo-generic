variable "storage_accounts" {
  description = "Map of storage accounts to be created"
  type = map(object({
    storage_account_name     = string
    resource_group_name      = string
    storage_account_location = string
    account_tier             = string
    account_replication_type = string
  }))
}