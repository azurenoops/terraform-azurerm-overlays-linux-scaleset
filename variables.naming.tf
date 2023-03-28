
# Generic naming variables
variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Optional suffix for the generated name"
  type        = string
  default     = ""
}

variable "use_naming" {
  description = "Use the Azure NoOps naming provider to generate default resource name. `custom_name` override this if set. Legacy default name is used if this is set to `false`."
  type        = bool
  default     = true
}

# Custom naming override
variable "custom_resource_group_name" {
  description = "The name of the custom resource group to create. If not set, the name will be generated using the `org_name`, `workload_name`, `deploy_environment` and `environment` variables."
  type        = string
  default     = null
}

variable "custom_vmss_name" {
  description = "Custom name for the Virtual Machine ScaleSet."
  type        = string
  default     = null
}

variable "custom_nic_name" {
  description = "Custom name for Network Interfaces."
  type        = string
  default     = null
}

variable "custom_ipconfig_name" {
  description = "Custom name for Ipconfiguration."
  type        = string
  default     = null
}

variable "custom_dcr_name" {
  description = "Custom name for Data collection rule association."
  type        = string
  default     = null
}