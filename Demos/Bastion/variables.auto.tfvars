# infra.tf
resource_group_name = "RG1"
location            = "westeurope"

# VNET
vnets = [
  {
    vnet_name          = "vnet1"
    vnet_address_space = ["10.1.0.0/16"]
    subnets = [
      {
        subnet_name          = "subnetVM1"
        subnet_address_space = "10.1.1.0/24"
      },
      {
        subnet_name          = "subnetVM2"
        subnet_address_space = "10.1.2.0/24"
      }
    ]
  },
  {
    vnet_name          = "vnet2"
    vnet_address_space = ["10.2.0.0/16"]
    subnets = [
      {
        subnet_name          = "subnetVM3"
        subnet_address_space = "10.2.1.0/24"
      }
    ]
  }
]

# VM
vms = [
  {
    vm_name     = "VM1"
    nic_name    = "nic1"
    vnet_name   = "vnet1"
    subnet_name = "subnetVM1"
    passeword   = "P@$$w0rd1234!"
    public_ip   = false
  },
  {
    vm_name     = "VM2"
    nic_name    = "nic2"
    vnet_name   = "vnet1"
    subnet_name = "subnetVM2"
    passeword   = "P@$$w0rd1234!"
    public_ip   = false
  },
  {
    vm_name     = "VM3"
    nic_name    = "nic3"
    vnet_name   = "vnet2"
    subnet_name = "subnetVM3"
    passeword   = "P@$$w0rd1234!"
    public_ip   = false
  }
]
