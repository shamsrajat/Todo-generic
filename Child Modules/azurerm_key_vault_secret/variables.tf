variable "kv_secret" {
  type = map(object({
    kv_secret_name  = string
    kv_secret_value = string
  }))

}