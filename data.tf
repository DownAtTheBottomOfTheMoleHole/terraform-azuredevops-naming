# Azure Resource Manager subscription information
data "azurerm_subscription" "azrm" {
  subscription_id = var.azrm_subscription_id == "" ? data.azurerm_client_config.azrm.subscription_id : var.azrm_subscription_id
}

# retrieve azure devops project information
data "azuredevops_project" "azdo" {
  name = var.azdo_project_name
}

# azure active directory (entra) client information
data "azuread_client_config" "azad" {}

# azure resource manager client information
data "azurerm_client_config" "azrm" {}


