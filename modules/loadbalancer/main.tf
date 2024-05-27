

resource "azurerm_lb" "lb" {
  name                = var.lbName
  location            = var.location
  resource_group_name = var.resourceGroupName
  sku                 = "Standard"

  frontend_ip_configuration {
    name      = "PublicIPAddress"
    subnet_id = var.subnet_id
  }
}
