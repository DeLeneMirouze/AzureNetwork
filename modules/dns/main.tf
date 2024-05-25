# deployer un private dns
resource "azurerm_private_dns_zone" "private_dns" {
  name                = var.dns_name
  resource_group_name = var.resource_group_name
}