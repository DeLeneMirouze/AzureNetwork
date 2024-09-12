
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


module "storage" {
  source               = "../../../modules/storage"
  storage_account_name = "amethystestor1"
  resource_group_name  = module.resourcesGroup.name
  location             = module.resourcesGroup.location
  container_name       = ["fleurs"]
  container_access_type = "container"
}

# module "storage" {
#   source               = "../../../modules/storage"
#   storage_account_name = "amethystestor2"
#   resource_group_name  = module.resourcesGroup.name
#   location             = module.resourcesGroup.location
#   container_name       = ["nantes"]
#   container_access_type = "container"
# }
