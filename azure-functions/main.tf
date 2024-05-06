resource "azurerm_resource_group" "example_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example_rg.name
  location                 = azurerm_resource_group.example_rg.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_app_service_plan" "example_plan" {
  name                = var.service_plan_name
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
  kind                = "FunctionApp"

  sku {
    tier = var.service_plan_tier
    size = var.service_plan_size
  }
}

resource "azurerm_function_app" "example_function_app" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.example_rg.location
  resource_group_name        = azurerm_resource_group.example_rg.name
  app_service_plan_id        = azurerm_app_service_plan.example_plan.id
  storage_account_name       = azurerm_storage_account.example_storage.name
  storage_account_access_key = azurerm_storage_account.example_storage.primary_access_key
}

resource "azurerm_function_app_function" "example_function" {
  name                       = "MyFunction"
  function_app_id            = azurerm_function_app.example_function_app.id
  resource_group_name        = azurerm_resource_group.example_rg.name
  app_service_plan_id        = azurerm_app_service_plan.example_plan.id
  storage_account_name       = azurerm_storage_account.example_storage.name
  storage_account_access_key = azurerm_storage_account.example_storage.primary_access_key
  https_only                 = true
}
