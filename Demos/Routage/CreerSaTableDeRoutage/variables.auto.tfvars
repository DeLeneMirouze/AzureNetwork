# infra.tf
resource_group_name = "RG1"
location            = "westeurope"

# VNET
vnets = [
  {
    vnet_name          = "vnet1"
    vnet_address_space = ["10.3.0.0/16"]
    subnets = [
      {
        subnet_name          = "subnet1"
        subnet_address_space = "10.3.1.0/24"
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
    subnet_name = "subnet1"
    passeword   = "P@$$w0rd1234!"
    public_ip   = true
  }
  
]
