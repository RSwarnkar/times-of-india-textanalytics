# Specify the required provider and its version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "random" {
  # Configuration options
}


# random suffix for unique naming
resource "random_string" "rg_suffix" {
  length  = 4
  lower   = true
  upper   = false
  numeric = false
  special = false
}

# random suffix for unique naming
resource "random_string" "ail_suffix" {
  length  = 4
  lower   = true
  upper   = false
  numeric = false
  special = false
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "rasw-rsg-usea-language-${random_string.rg-suffix.result}"
  location = "East US"
  tags = {
    "CreatedVia" = "Terraform"
  }
}

# Create a Cognitive Services account for Language Service
resource "azurerm_cognitive_account" "language_service" {
  name                = "rasw-lang-usea-language-svc-${random_string.ail-suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "TextAnalytics"
  sku_name            = "F0"
}
