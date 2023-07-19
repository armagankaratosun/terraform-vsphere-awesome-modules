# Vsphere/Vcenter variables
variable "vsphere_server" {
   type = string
   description = "URL for vSphere host, or vCenter server."
}

variable "vsphere_user" {
   type = string
   description = "username for either vSphere or vCenter, has to have necessary permissions to carry on tasks."
}

variable "vsphere_password" {
   type = string
   description = "password for the given user."
}

variable "vsphere_datacenter" {
   type = string
   description = "Name of your datacenter in vSphere/vCenter, usually, it is 'Datacenter'."
}

variable "vsphere_datastore" {
   type = string
   description = "Name of the datastore that you want to create volumes in."
}

variable "vsphere_compute_cluster" {
   type = string
   description = "Name of the compute cluster that you want to provision VMs"
}

variable "vsphere_virtual_machine_template" {
   type = string
   description = "Virtual machine template for "
}

variable "vsphere_networks" {
   type = list
   description = "List of your availabe networks in vSphere/vCenter. There should be at least one network."
}

# VM variables
variable "vm_name" {
   type = list
   description = "Desired virtual machine name. Can be a list of vm names to create multiple VMs."
}

variable "vm_volumes" {
  type = map(object({
    label = string
    size  = number
    thin_provisioned = bool
    unit_number = number
  }))
  description = "List of virtual machine volumes, there should be at least one (boot) volume with unit_number = 0"
}

variable vm_num_cpus { 
   type = number
   default = 2
   description = "2 cores by default."
}

variable vm_memory { 
   type = number
   default = 2048
   description = "2GB RAM by default."
}

variable "cloud_init_data" {
   type = string
   description = "User-input for cloud init"
}
