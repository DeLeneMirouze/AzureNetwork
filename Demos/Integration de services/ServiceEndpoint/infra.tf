
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


module "storage1" {
  source               = "../../../modules/storage"
  storage_account_name = "amethystestor1"
  resource_group_name  = module.resourcesGroup.name
  location             = module.resourcesGroup.location
  container_name       = ["containersubnet1A"]
}

module "storage2" {
  source               = "../../../modules/storage"
  storage_account_name = "amethystestor2"
  resource_group_name  = module.resourcesGroup.name
  location             = module.resourcesGroup.location
  container_name       = ["containersubnet2A"]
}