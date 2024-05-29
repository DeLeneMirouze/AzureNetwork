# infra.tf
resource_group_name = "RG1"
location            = "westeurope"

# VNET
vnets = [
  {
    vnet_name          = "vnetA"
    vnet_address_space = ["10.3.0.0/16"]
    subnets = [
      {
        subnet_name          = "subnetA"
        subnet_address_space = "10.3.1.0/24"
      },
      {
        subnet_name          = "subnetB"
        subnet_address_space = "10.3.2.0/24"
      }
    ]
  }
]

# VM
vms = [
  {
    vm_name     = "VM1"
    nic_name    = "nic1"
    vnet_name   = "vnetA"
    subnet_name = "subnetA"
    passeword   = "P@$$w0rd1234!"
    public_ip   = true
  },
  {
    vm_name     = "VM2"
    nic_name    = "nic2"
    vnet_name   = "vnetA"
    subnet_name = "subnetB"
    passeword   = "P@$$w0rd1234!"
    public_ip   = true
  }
]

routes = {
  route_name = "myRouteTable"
  routes = [
    {
      name           = "myRoute"
      address_prefix = "142.250.0.0/16"
      next_hop_type  = "VirtualAppliance"
      next_hop_in_ip = "10.3.2.4"
    }
  ]
}

