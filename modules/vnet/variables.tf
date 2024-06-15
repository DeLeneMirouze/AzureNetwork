variable "vnet_name" {
  description = "Le nom du réseau virtuel"
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

variable "address_space" {
  description = "L'espace d'adressage du réseau virtuel"
  type        = list(string)
}

variable "subnets" {
  type = list(object({
    subnet_name          = string
    subnet_address_space = string
  }))
}
