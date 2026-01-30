terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
}

resource "azurerm_resource_group" "mate-terraform" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "mate-terraform-storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.mate-terraform.name
  location                 = azurerm_resource_group.mate-terraform.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "mate-terraform-vhds" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.mate-terraform-storage.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "mate-terraform-blob" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.mate-terraform-storage.name
  storage_container_name = azurerm_storage_container.mate-terraform-vhds.name
  type                   = "Block"
  source                 = data.archive_file.terraform_code_archive.output_path
}
