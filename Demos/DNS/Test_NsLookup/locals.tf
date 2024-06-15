locals {
  flat_vnets = flatten([
    for vnet in var.vnets : [
      for subnet in vnet.subnets : {
        vnet_name            = vnet.vnet_name
        vnet_address_space   = vnet.vnet_address_space
        subnet_name          = subnet.subnet_name
        subnet_address_space = subnet.subnet_address_space
      }
    ]
  ])
}


