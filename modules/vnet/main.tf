
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name           = subnet.value.subnet_name
      address_prefix = subnet.value.subnet_address_space
    }
  }
}

