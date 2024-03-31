variable "subnet_name" {
  description = "Le nom du subnet"
  type        = string
}

variable "resource_group_name" {
  description = "Le nom du groupe de ressources"
  type        = string
}

variable "vnet_name" {
  description = "Le nom du réseau virtuel"
  type        = string
}

variable "subnet_address_space" {
  description = "L'espace d'adressage du subnet"
  type        = list(string)
}