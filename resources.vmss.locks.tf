# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#------------------------------------------------------------------
# Azure Linux VMSS Lock configuration - Default (required). 
#------------------------------------------------------------------
resource "azurerm_management_lock" "vmss_level_lock" {
  count      = var.enable_resource_locks ? 1 : 0
  name       = "${local.vmss_name}-${var.lock_level}-lock"
  scope      = azurerm_linux_virtual_machine_scale_set.linux_vmss.id
  lock_level = var.lock_level
  notes      = "Azure Linux VMSS '${local.vmss_name}' is locked with '${var.lock_level}' level."
}
