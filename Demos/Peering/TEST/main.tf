
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_mssql_server" "primary" {
  name                          = var.sqlserver_name
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = var.location
  administrator_login           = "dba_archi"
  administrator_login_password  = "P@$$w0rd1234!"
  minimum_tls_version           = "1.2"
  version                       = "12.0"
  public_network_access_enabled = true

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.uai.id]
  }

  transparent_data_encryption_key_vault_key_id = azurerm_key_vault_key.exemple_key.id
  primary_user_assigned_identity_id            = azurerm_user_assigned_identity.uai.id
  #   connection_policy                            = contains(["prd", "ppd"], var.environment) ? "Default" : "Proxy"

  azuread_administrator {
    login_username = azurerm_user_assigned_identity.uai.name
    object_id      = azurerm_user_assigned_identity.uai.principal_id
    tenant_id      = "7dda5ce2-2fb6-4f82-bc27-229ad439811e"
  }
}

resource "azurerm_user_assigned_identity" "uai" {
  name                = "${var.sqlserver_name}-msi"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}


# création d'un key vault
resource "azurerm_key_vault" "exemple_rbac" {
  name                = "nomKeyVaultRBAC2"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = "7dda5ce2-2fb6-4f82-bc27-229ad439811e"
  sku_name            = "standard" # Choisir selon le besoin

  soft_delete_retention_days = 7
  purge_protection_enabled   = true # Optionnel

  # network_acls {
  #   default_action = "Deny"
  #   bypass         = "AzureServices"
  # }

  # Activation du RBAC pour la gestion des accès
    enable_rbac_authorization = false

  access_policy {
    tenant_id = "7dda5ce2-2fb6-4f82-bc27-229ad439811e"
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "Create",
      "Get",
      "List",
      "GetRotationPolicy",
      "Delete",
      "Purge",
      "Update",
      "SetRotationPolicy",
      "Import",
      "UnwrapKey",
      "WrapKey",
      "Sign",
      "Encrypt",
      "Decrypt",
      "Recover"
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Purge"
    ]
  }

  access_policy {
    tenant_id = "7dda5ce2-2fb6-4f82-bc27-229ad439811e"
    object_id = azurerm_user_assigned_identity.uai.principal_id

    secret_permissions = [
      "Get",
      "List"
    ]

    key_permissions = ["List", "Get", "WrapKey", "UnwrapKey", "Recover"]
  }
}

resource "azurerm_key_vault_key" "exemple_key" {
  depends_on   = [azurerm_key_vault.exemple_rbac]
  name         = "exempleKey2"
  key_vault_id = azurerm_key_vault.exemple_rbac.id
  key_type     = "RSA"
  key_size     = 3072
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey"
  ]

  #   expiration_date = "2025-01-01T01:02:03Z"  # Optionnel
}

data "azurerm_client_config" "current" {}

# output "account_id" {
#   value = data.azurerm_client_config.current.client_id
# }

# output "tenant_id" {
#   value = data.azurerm_client_config.current.tenant_id
# }

# output "subscription_id" {
#   value = data.azurerm_client_config.current.subscription_id
# }
