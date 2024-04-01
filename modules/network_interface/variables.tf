variable "vm_nic" {
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

variable "subnet_id" {
  description = "L'ID du sous-réseau"
  type        = string
}

variable "public_ip" {
  type    = bool
  default = false
}



