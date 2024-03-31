
module "resourcesGroup" {
  source      = "../../../modules/resourcesGroup"
  rg_name     = "rg1"
  rg_location = "westus"
}


module "vnet" {
  source              = "../../../modules/vnet"
  resource_group_name = module.resourcesGroup.name
  location            = module.resourcesGroup.location
  vnet_name           = "vnet1"
  address_space       = ["10.3.0.0/16"]
}

module "subnet1" {
  source               = "../../../modules/subnets"
  resource_group_name  = module.resourcesGroup.name
  vnet_name            = module.vnet.vnet_name
  subnet_name          = "subnet1"
  subnet_address_space = ["10.3.1.0/24"]
}
