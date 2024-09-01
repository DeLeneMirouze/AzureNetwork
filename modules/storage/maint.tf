
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  count                 = length(var.container_name)
  name                  = lower(var.container_name[count.index])
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = var.container_access_type
}
