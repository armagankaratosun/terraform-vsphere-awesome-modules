resource "vsphere_virtual_machine" "vm" {
  count           = length(var.vm_name)
  name            = var.vm_name[count.index]
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = var.vm_num_cpus
  memory           = var.vm_memory
  guest_id = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type
  ept_rvi_mode                            = "automatic"
  hv_mode                                 = "hvAuto"

  network_interface {
    network_id = data.vsphere_network.available_networks[count.index].id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  dynamic "disk" {
    for_each = var.vm_volumes
    content {
      label             = disk.value.label
      size              = disk.value.size
      thin_provisioned  = disk.value.thin_provisioned
      unit_number      = disk.value.unit_number

    }
  }
  cdrom {
    client_device = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
  
  extra_config = {
   "guestinfo.userdata"          = var.cloud_init_data
   "guestinfo.metadata"          = var.metadata
  }
}

output "vm_ip" {
  value = vsphere_virtual_machine.vm.*.guest_ip_addresses
}