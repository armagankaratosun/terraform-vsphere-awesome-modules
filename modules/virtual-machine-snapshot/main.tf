resource "vsphere_virtual_machine_snapshot" "snapshot" {
  count           = length(var.vm_name)

  virtual_machine_uuid = data.vsphere_virtual_machine.vm[count.index].uuid
  snapshot_name        = var.snapshot_name[count.index]
  description          = var.description
  memory               = var.memory
  quiesce              = var.quiesce
  remove_children      = var.remove_children
  consolidate          = var.consolidate
}