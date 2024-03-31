variable "sqlServerName" {
  type = string
}

variable "resourceGroupName" {
  type = string
}

variable "location" {
  type = string
}

variable "sqlServerAdminPassword" {
  type      = string
  sensitive = true
}

variable "databases" {
  type = list(
    object({
      name = string
      sku  = optional(string, "S0")
    })
  )
}
