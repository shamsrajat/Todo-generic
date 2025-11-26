variable "nsg_subnet_association" {
  description = "Map of NSG ID (key) to Subnet ID (value)"
  type = map(string)
}