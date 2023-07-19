data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_virtual_machine" "vm" {
  count = length(var.vm_name)
  name = var.vm_name[count.index]  # Use the VM name instead of UUID as the variable
  datacenter_id =data.vsphere_datacenter.dc.id
}