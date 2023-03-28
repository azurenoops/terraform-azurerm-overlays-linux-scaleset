# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

resource "azurerm_virtual_machine_scale_set_extension" "azure_monitor_agent" {
  count = var.azure_monitor_agent_enabled ? 1 : 0

  name = "${azurerm_linux_virtual_machine_scale_set.linux_vmss.name}-azmonitorextension"

  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = var.azure_monitor_agent_version
  auto_upgrade_minor_version = "true"

  virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.linux_vmss.id
}

resource "azurerm_monitor_data_collection_rule_association" "dcr" {
  count = var.azure_monitor_agent_enabled ? 1 : 0

  name                    = local.dcr_name
  target_resource_id      = azurerm_linux_virtual_machine_scale_set.linux_vmss.id
  data_collection_rule_id = var.azure_monitor_data_collection_rule_id

  lifecycle {
    precondition {
      condition     = var.azure_monitor_data_collection_rule_id != "" && var.azure_monitor_data_collection_rule_id != null
      error_message = "The `azure_monitor_data_collection_rule_id` value must be valid, non-empty and non-null.\nAzure Monitor can be disabled with `var.azure_monitor_enabled = false`."
    }
  }
}
