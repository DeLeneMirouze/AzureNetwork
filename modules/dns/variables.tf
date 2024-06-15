
variable "resource_group_name" {
  description = "Le nom du groupe de ressources"
  type        = string
}

variable "dns_name" {
  description = "Le nom du DNS privé"
  type        = string
}

variable "dns_record" {
  description = "Liste de recordset type A"
  type = list(object({
    name   = string
    record = string
  }))
  default = []
}
