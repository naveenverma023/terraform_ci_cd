terraform {
  backend "azurerm" {
    resource_group_name  = "testing_tf_infra_state_rg"
    storage_account_name = "testingtfinfrastate"
    container_name       = "tesingtfinfrastatecontainer"
    key  = "testing/network/network.tfstate" # Or any other key you prefer
  }
}