resource "azurerm_storage_account" "stg"{
    name = var.storage_account_name
    location = var.location_name
    resource_group_name = var.rg_name
    account_tier = "Standard"
    account_replication_type = "LRS"
    tags = var.tags
}