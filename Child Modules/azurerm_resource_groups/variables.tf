variable "resource_groups" {
  description = "Map of Resource Group to be created"
  type = map(object({
    rg_name     = string
    rg_location = string
  }))
}
