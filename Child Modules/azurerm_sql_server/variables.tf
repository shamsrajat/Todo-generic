variable "sqlserver" {
  type = map(object({
    sqlserver_name     = string
    sql_rg_name        = string
    sqlserver_location = string
    sqlserver_version  = string
    sql_admin_userid   = string
    sql_admin_password = string
  }))
}

variable "sqldb" {
  type = map(object({
    sqldb_name = string
    server_key = string
  }))
}
