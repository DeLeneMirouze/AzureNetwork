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
      },
      {
        subnet_name          = "subnetC"
        subnet_address_space = "10.3.3.0/24"
      }
    ]
  },

  {
    vnet_name          = "vnetB"
    vnet_address_space = ["10.4.0.0/16"]
    subnets = [
      {
        subnet_name          = "subnetD"
        subnet_address_space = "10.4.1.0/24"
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
    public_ip   = false
  },
  {
    vm_name     = "VM3"
    nic_name    = "nic3"
    vnet_name   = "vnetB"
    subnet_name = "subnetD"
    passeword   = "P@$$w0rd1234!"
    public_ip   = true
  }
]

routes = {
  route_name = "myRouteTable"
  routes = [
    {
      name           = "stopInternet"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "None"
    }
  ]
}

lbs = {
  name      = "lb1"
}

