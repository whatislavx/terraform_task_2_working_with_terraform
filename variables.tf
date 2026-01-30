variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "tf-infra-rg"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "France Central"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "whatislavxtfinfra"
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
  default     = "tfstate"
}

variable "blob_name" {
  description = "The name of the storage blob"
  type        = string
  default     = "terraform-project.tar.gz"
}


