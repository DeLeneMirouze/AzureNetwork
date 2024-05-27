module "vnet" {
  count               = length(var.vnets)
  source              = "../../modules/vnet"
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

module "loadbalancer" {
  count             = var.lbs != null ? 1 : 0
  source            = "../../modules/loadbalancer"
  resourceGroupName = module.resourcesGroup.name
  location          = module.resourcesGroup.location
  lbName            = var.lbs.name
  subnet_id         = module.vnet[local.vnet_index].subnets[local.subnet_index].subnet_id
  vnet_name         = var.lbs.vnet_name
  subnet_name       = var.lbs.subnet_name
}

variable "lbs" {
  type = object({
    name = string
    # subnet_id = string
    vnet_name   = string
    subnet_name = string
  })
  default = null
}

locals {
  flattened_subnets = flatten([
    for vnet in var.vnets : [
      for subnet in vnet.subnets : {
        vnet_index  = index(var.vnets, vnet)
        subnet_name = subnet.subnet_name
      }
    ]
  ])
  # infos sur le vnet du lbs
  subnet_index = index([for s in local.flattened_subnets : s.subnet_name], var.lbs.subnet_name)
  vnet_index   = local.flattened_subnets[local.subnet_index].vnet_index
}

