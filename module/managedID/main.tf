variable "location" {}
variable "rg_name" {}   
variable "managed_id_name" {}
variable "tags" {}

resource "azurerm_user_assigned_identity" "managed_id" {
  location            = var.location
  name                = var.managed_id_name
  resource_group_name = var.rg_name
  tags                = var.tags
}