
variable "resource_group_name" {
  description = "Le nom du groupe de ressources"
  type        = string
}

variable "hub" {
  type = object({
    name = string
    id   = string
  })
}

variable "spoke" {
  type = object({
    name = string
    id   = string
  })
}