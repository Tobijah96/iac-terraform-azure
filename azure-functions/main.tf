resource "azurerm_function_app" "example_function_app" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.example_rg.location
  resource_group_name        = azurerm_resource_group.example_rg.name
  app_service_plan_id        = azurerm_app_service_plan.example_plan.id
  storage_account_name       = azurerm_storage_account.example_storage.name
  storage_account_access_key = azurerm_storage_account.example_storage.primary_access_key

  site_config {
    app_settings = {
      "FUNCTIONS_WORKER_RUNTIME" = "python"
    }
  }

  app_settings {
    "AzureWebJobsStorage" = "DefaultEndpointsProtocol=https;AccountName=${azurerm_storage_account.example_storage.name};AccountKey=${azurerm_storage_account.example_storage.primary_access_key};EndpointSuffix=core.windows.net"
  }

  version {
    slot_name = "staging"
    slot_configuration_source = "true"
  }
}
