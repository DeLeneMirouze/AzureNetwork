
module "resourcesGroup" {
  source   = "../../../modules/resourcesGroup"
  rg_name  = var.resource_group_name
  location = var.location
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}


