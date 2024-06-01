module "vnet" {
  count               = length(var.vnets)
  source              = "../../../modules/vnet"
  resource_group_name = module.resourcesGroup.name
  location            = module.resourcesGroup.location
  vnet_name           = var.vnets[count.index].vnet_name
  address_space       = var.vnets[count.index].vnet_address_space
  subnets             = var.vnets[count.index].subnets
}

variable "vnets" {
  type = list(object({
    vnet_name          = string
    vnet_address_space = list(string)
    subnets = list(object({
      subnet_name          = string
      subnet_address_space = string
    }))
  }))
}

