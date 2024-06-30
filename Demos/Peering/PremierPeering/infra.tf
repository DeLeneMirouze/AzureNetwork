
module "resourcesGroup" {
  source   = "../../../modules/resourcesGroup"
  rg_name  = var.resource_group_name
  location = var.location
}

# module "dns" {
#   source              = "../../../modules/dns"
#   dns_name            = "mydomain.com"
#   resource_group_name = module.resourcesGroup.name
#   dns_record = [
#   ]
# }

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}


