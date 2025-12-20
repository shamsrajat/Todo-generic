variable "subnet_ids" {
  description = "Map of subnet IDs"
  type        = map(string)
}

variable "nsg_id" {
  description = "NSG ID"
  type        = string
}
