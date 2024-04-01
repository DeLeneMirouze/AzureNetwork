
module "nic" {
  count               = length(var.vms)
  source              = "../../../modules/network_interface"
  resource_group_name = module.resourcesGroup.name
  location            = module.resourcesGroup.location
  vm_nic              = var.vms[count.index].nic_name
  public_ip           = true

  subnet_id = flatten([
    for vnet in module.vnet : [
      for subnet in vnet.subnets :
      subnet.subnet_id if subnet.subnet_name == var.vms[count.index].subnet_name && subnet.vnet_name == var.vms[count.index].vnet_name
    ]
  ])[0]
}

module "vm" {
  count               = length(var.vms)
  source              = "../../../modules/vm"
  resource_group_name = module.resourcesGroup.name
  location            = module.resourcesGroup.location
  vm_name             = var.vms[count.index].vm_name
  nic_id              = module.nic[count.index].id
  password            = var.vms[count.index].passeword
}

variable "vms" {
  type = list(object({
    vm_name     = string
    nic_name    = string
    subnet_name = string
    vnet_name   = string
    passeword   = string
  }))
}

