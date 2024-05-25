output "public_ip" {
  value = azurerm_lb.lb.frontend_ip_configuration[0].public_ip_address_id
}
