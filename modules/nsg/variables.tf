variable "nsgName" {
  type = string
}

variable "resourceGroupName" {
  type = string
}

variable "location" {
  type = string
}

variable "rules" {
  type = list(
    object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = optional(string, "*")
      destination_port_range     = optional(string, "*")
      source_address_prefix      = optional(string, "*")
      destination_address_prefix = optional(string, "*")
    })
  )
}
