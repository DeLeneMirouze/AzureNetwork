
module "nsg" {
  count             = length(local.nsg_infos)
  source            = "../../modules/nsg"
  rules             = local.nsg_infos[count.index].rules
  nsgName           = local.nsg_infos[count.index].nsg_name
  resourceGroupName = var.resource_group_name
  location          = var.location
}


