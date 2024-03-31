resource "azurerm_mssql_server" "sqlServer" {
  name                         = local.sqlServer_name
  resource_group_name          = var.resourceGroupName
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "admin_archi"
  administrator_login_password = var.sqlServerAdminPassword
}

resource "azurerm_mssql_database" "example" {
  count     = length(var.databases)
  name      = var.databases[count.index].name
  server_id = azurerm_mssql_server.sqlServer.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  sku_name  = var.databases[count.index].sku
}
