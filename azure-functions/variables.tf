variable "resource_group_name" {
  description = "Nazwa grupy zasobów"
}

variable "location" {
  description = "Lokalizacja zasobów"
}

variable "storage_account_name" {
  description = "Nazwa konta magazynu"
}

variable "storage_account_tier" {
  description = "Typ konta magazynu"
}

variable "storage_account_replication_type" {
  description = "Typ replikacji konta magazynu"
}

variable "service_plan_name" {
  description = "Nazwa planu usługi"
}

variable "service_plan_tier" {
  description = "Tier planu usługi"
}

variable "service_plan_size" {
  description = "Rozmiar planu usługi"
}

variable "function_app_name" {
  description = "Nazwa aplikacji funkcji"
}
