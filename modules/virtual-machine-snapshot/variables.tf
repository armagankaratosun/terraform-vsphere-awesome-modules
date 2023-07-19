variable "vsphere_datacenter" {
   type = string
   description = "Name of your datacenter in vSphere/vCenter, usually, it is 'Datacenter'."
}

#VM Snapshot variables
variable "vm_name" {
   type = list
   description = "The name of the virtual machine from which the snapshot will be taken. Can be a list of vm names to create snapshots of multiple virtual machines."
}

variable "snapshot_name" {
  type = list
  description = "Name of the snapshot."
}

variable "description" {
  description = "Description of the snapshot."
}

variable "memory" {
  type        = bool
  description = "Flag to indicate whether to capture the virtual machine's memory state."
  default     = true
}

variable "quiesce" {
  type        = bool
  description = "Flag to indicate whether to quiesce the file system in the virtual machine."
  default     = true
}

variable "remove_children" {
  type        = bool 
  description = "Flag to indicate whether to remove child snapshots when taking the snapshot."
  default     = false
}

variable "consolidate" {
  type        = bool 
  description = "Flag to indicate whether to consolidate the virtual machine's disk files."
  default     = true
}