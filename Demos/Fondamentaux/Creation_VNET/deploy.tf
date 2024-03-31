
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

module "subnet" {
  source               = "../../../modules/subnets"
  resource_group_name  = module.resourcesGroup.name
  vnet_name            = module.vnet.vnet_name
  subnet_name          = "subnet1"
  subnet_address_space = ["10.3.1.0/24"]
}

module "nic" {
  source              = "../../../modules/network_interface"
  resource_group_name = module.resourcesGroup.name
  location            = module.resourcesGroup.location
  vm_nic              = "nic1"
  subnet_id           = module.subnet.subnet_id
}

module "vm" {
  source              = "../../../modules/vm"
  resource_group_name = module.resourcesGroup.name
  location            = module.resourcesGroup.location
  vm_name             = "vm1"
  nic_id              = module.nic.id
}


