module "routeTable" {
  count               = length(var.vnets)
  source              = "../../../modules/routeTable"
  resource_group_name = module.resourcesGroup.name
  location            = module.resourcesGroup.location
  route_name          = var.routes.route_name
  routes              = var.routes.routes
}

variable "routes" {
  type = object({
    route_name = string
    routes = list(object({
      name           = string
      address_prefix = string
      next_hop_type  = string
      next_hop_in_ip = optional(string)
    }))
  })
}



