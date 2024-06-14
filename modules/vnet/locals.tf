# locals {
#   nsg_infos = [
#     for subnet in var.subnets : {
#       nsgs = [
#         for nsg in subnet.nsgs : {
#           subnet_name          = subnet.subnet_name
#           subnet_address_space = subnet.subnet_address_space
#           nsg_name             = nsg.nsg_name
#           rules                = nsg.rules
#         }
#       ]
#     }
#   ]
# }


locals {
  nsg_infos = flatten([
    for subnet in var.subnets : [
      for nsg in subnet.nsgs : {
        subnet_name          = subnet.subnet_name
        subnet_address_space = subnet.subnet_address_space
        nsg_name             = nsg.nsg_name
        rules                = nsg.rules
      }
    ]
  ])
}
