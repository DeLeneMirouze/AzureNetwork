
variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the storage account will be created"
  type        = string
}

variable "location" {
  description = "The location/region where the storage account will be created"
  type        = string
}

variable "container_name" {
  description = "The name of the storage container"
  type        = list(string)
}

variable "container_access_type" {
  description = "The access type of the storage container"
  type        = string
  default     = "private"

  validation {
    condition     = var.container_access_type == "private" || var.container_access_type == "blob" || var.container_access_type == "container"
    error_message = "Invalid container access type. Valid values are private, blob, or container."
  }
}
