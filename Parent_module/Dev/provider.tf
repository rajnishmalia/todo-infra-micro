terraform{
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "4.41.0"
        }
    }
    backend "azurerm"{
        resource_group_name = "rg-terraform-state"
        storage_account_name = "statetodoapp"
        container_name = "tfstate"
        key = "dev.terraform.tfstate"
    }
    
}
provider "azurerm"{
    features{}
    subscription_id = "85bce315-2d40-4002-a3d1-b7f28202855c"
}