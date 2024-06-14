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
    nsgs = list(object({
      nsg_name = string
      rules = list(
        object({
          name                       = string
          priority                   = number
          direction                  = string
          access                     = string
          protocol                   = string
          source_port_range          = optional(string, "*")
          destination_port_range     = optional(string, "*")
          source_address_prefix      = optional(string, "*")
          destination_address_prefix = optional(string, "*")
        })
      )
    }))
  }))
}
