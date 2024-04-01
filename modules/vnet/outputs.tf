output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnets" {
  value = [
    for s in azurerm_virtual_network.vnet.subnet : {
      subnet_id   = s.id
      subnet_name = s.name
    }
  ]
}

