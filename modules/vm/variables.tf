variable "vm_name" {
  description = "Le nom de la machine virtuelle"
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

variable "nic_id" {
  description = "L'ID de la carte réseau"
  type        = string
}

