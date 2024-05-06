# main.tf

variable "resource_group_name" {
  default = "my-resource-group" 
}

variable "storage_account_name" {
  default = "mystorageaccount" 
}

variable "container_name" {
  default = "mycontainer" 
}

variable "blob_name" {
  default = "myblob" 
}

variable "location" {
  default = "Poland" 
}

variable "storage_account_tier" {
  default = "Standard" 
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source                 = "path/to/local/file"
}
