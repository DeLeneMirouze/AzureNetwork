variable "route_name" {
  description = "Le nom de la table de routage"
  type        = string
}

variable "resource_group_name" {
  description = "Le nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "L'emplacement de la ressource"
  type        = string
}

variable "routes" {
  description = "Les routes de la table de routage"
  type = list(object({
    name           = string
    address_prefix = string
    next_hop_type  = string
    next_hop_in_ip = optional(string)
  }))
}
