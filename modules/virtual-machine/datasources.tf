data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}
data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
data "vsphere_compute_cluster" "cluster" {
    name          = var.vsphere_compute_cluster
    datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "available_networks" {
  count = length(var.vsphere_networks)
  name  = var.vsphere_networks[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_virtual_machine_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Data source for vCenter Content Library
data "vsphere_content_library" "content_library" {
  name = "local"
}

# Data source for vCenter Content Library Item
data "vsphere_content_library_item" "ubuntu-cloud-image" {
  name       = "ubuntu-22.04-cloud-init-image"
  type       = "ovf"
  library_id = data.vsphere_content_library.content_library.id
}

