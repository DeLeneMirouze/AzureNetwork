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
        subnet_name          = "subnet1A"
        subnet_address_space = "10.3.1.0/24"
      },
      {
        subnet_name          = "subnet2A"
        subnet_address_space = "10.3.2.0/24"
      }
    ]
  },
  # {
  #   vnet_name          = "vnetB"
  #   vnet_address_space = ["10.4.0.0/16"]
  #   subnets = [
  #     {
  #       subnet_name          = "subnet1B"
  #       subnet_address_space = "10.4.1.0/24"
  #     }
  #   ]
  # }
]

# VM
vms = [
  {
    vm_name     = "VM1A"
    nic_name    = "nic1"
    vnet_name   = "vnetA"
    subnet_name = "subnet1A"
    passeword   = "P@$$w0rd1234!"
    public_ip   = false
  },
  {
    vm_name     = "VM2A"
    nic_name    = "nic2"
    vnet_name   = "vnetA"
    subnet_name = "subnet2A"
    passeword   = "P@$$w0rd1234!"
    public_ip   = false
  },
  # {
  #   vm_name     = "VM3B"
  #   nic_name    = "nic3"
  #   vnet_name   = "vnetB"
  #   subnet_name = "subnet1B"
  #   passeword   = "P@$$w0rd1234!"
  #   public_ip   = false
  # }
]
