# deployer un private dns
resource "azurerm_private_dns_zone" "private_dns" {
  name                = var.dns_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_a_record" "arecord" {
  count               = length(var.dns_record)
  name                = var.dns_record[count.index].name
  zone_name           = azurerm_private_dns_zone.private_dns.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [var.dns_record[count.index].record]
}
