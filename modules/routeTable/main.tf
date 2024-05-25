resource "azurerm_route_table" "table" {
  name                = var.route_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_route" "example" {
  count                  = length(var.routes)
  name                   = var.routes[count.index].name
  resource_group_name    = azurerm_route_table.table.resource_group_name
  route_table_name       = azurerm_route_table.table.name
  address_prefix         = var.routes[count.index].address_prefix
  next_hop_type          = var.routes[count.index].next_hop_type
  next_hop_in_ip_address = var.routes[count.index].next_hop_in_ip
}
