variable "public_ip" {
  description = "this is a map of public IP variable"
  type = map(object({
    pip_name              = string
    pip_rgname            = string
    pip_location          = string
    pip_allocation_method = string
  }))


}