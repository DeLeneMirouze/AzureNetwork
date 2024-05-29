resource "azurerm_network_interface" "example" {
  name                 = var.vm_nic
  location             = var.location
  resource_group_name  = var.resource_group_name
  enable_ip_forwarding = var.enable_ip_forwarding

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip ? azurerm_public_ip.public_ip[0].id : null
  }
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.public_ip ? 1 : 0
  name                = "${var.vm_nic}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

