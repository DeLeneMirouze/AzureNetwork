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
      nsgs = optional(list(object({
        nsg_name = string
        rules = list(
          object({
            name                       = string
            priority                   = number
            direction                  = string
            access                     = string
            protocol                   = string
            source_port_range          = optional(string, "*")
            destination_port_range     = optional(string, "*")
            source_address_prefix      = optional(string, "*")
            destination_address_prefix = optional(string, "*")
          })
        )
      })), [])
    }))
  }))
}

output "vnet" {
  value = module.vnet
}


module "peering" {
  count               = length(var.hub_spoke_peerings)
  source              = "../../../modules/peering"
  resource_group_name = module.resourcesGroup.name
  hub = {
    name = var.hub_spoke_peerings[count.index].hub_name
    id   = lookup(local.vnet_map, var.hub_spoke_peerings[count.index].hub_name, null)
  }
  spoke = {
    name = var.hub_spoke_peerings[count.index].spoke_name
    id   = lookup(local.vnet_map, var.hub_spoke_peerings[count.index].spoke_name, null)
  }
}

locals {
  vnet_map = { for i in range(length(var.vnets)) : var.vnets[i].vnet_name => module.vnet[i].vnet_id }
}

variable "hub_spoke_peerings" {
  type = list(object({
    hub_name   = string
    spoke_name = string
  }))
}


