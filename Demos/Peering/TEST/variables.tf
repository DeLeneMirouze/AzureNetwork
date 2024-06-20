
variable "rg_name" {
  type    = string
  default = "RG2"
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "environment" {
  type    = string
  default = "dv"
}

variable "sqlserver_name" {
  type    = string
  default = "sqlfdl1"
}

provider "azurerm" {
  skip_provider_registration = true

  features {
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.74.0"
    }
  }
}