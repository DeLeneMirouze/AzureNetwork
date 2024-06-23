resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                         = "${var.hub.name}-to-${var.spoke.name}"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = var.hub.name
  remote_virtual_network_id    = var.spoke.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                         = "${var.spoke.name}-to-${var.hub.name}"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = var.spoke.name
  remote_virtual_network_id    = var.hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = false
}
