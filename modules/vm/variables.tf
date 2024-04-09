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

variable "password" {
  description = "Le mot de passe de l'administrateur adminuser"
  type        = string
  default     = "P@$$w0rd1234!"
  sensitive   = true
}
