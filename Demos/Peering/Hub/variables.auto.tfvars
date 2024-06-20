# infra.tf
resource_group_name = "RG1"
location            = "westeurope"

# VNET
vnets = [
  {
    vnet_name          = "spoke1"
    vnet_address_space = ["10.1.0.0/16"]
    subnets = [
      {
        subnet_name          = "subnet1"
        subnet_address_space = "10.1.1.0/24"
      }
    ]
  },
  {
    vnet_name          = "spoke2"
    vnet_address_space = ["10.2.0.0/16"]
    subnets = [
      {
        subnet_name          = "subnet2"
        subnet_address_space = "10.2.1.0/24"
      }
    ]
  },
  {
    vnet_name          = "vnet-hub"
    vnet_address_space = ["10.0.0.0/16"]
    subnets = [
      {
        subnet_name          = "GatewaySubnet2"
        subnet_address_space = "10.0.0.0/27"
      }
    ]
  }
]

# VM
vms = [
  {
    vm_name     = "VM1"
    nic_name    = "nic1"
    vnet_name   = "spoke1"
    subnet_name = "subnet1"
    passeword   = "P@$$w0rd1234!"
    public_ip   = true
  },
  {
    vm_name     = "VM2"
    nic_name    = "nic2"
    vnet_name   = "spoke2"
    subnet_name = "subnet2"
    passeword   = "P@$$w0rd1234!"
    public_ip   = true
  }
]

