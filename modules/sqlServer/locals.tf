locals {
  sqlServer_name = lower("${var.sqlServerName}${var.resourceGroupName}")
}
