
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
      # security_group = subnet.value.subnet_name != "GatewaySubnet" ? azurerm_network_security_group.nsg_group.id : null
    }
  }
}

# resource "azurerm_network_security_rule" "nsg" {
#   name                        = "ICMP-Allow"
#   priority                    = 100
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Icmp"
#   source_port_range           = "*"
#   destination_port_range      = "*"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = var.resource_group_name
#   network_security_group_name = azurerm_network_security_group.nsg_group.name
# }

# resource "azurerm_network_security_group" "nsg_group" {
#   name                = "acceptanceTestSecurityGroup1"
#   location            = var.location
#   resource_group_name = var.resource_group_name
# }
