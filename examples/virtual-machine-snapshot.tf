module "snapshot" {
  source = "git::https://github.com/armagankaratosun/terraform-vsphere-awesome-modules.git//modules/virtual-machine-snapshot"

  vsphere_datacenter   = "Datacenter"
  vm_name              = ["vm-to-be-snapshotted-01","vm-to-be-snapshotted-02"]
  snapshot_name        = ["snapshot-vm-to-be-snapshotted-01","snapshot-vm-to-be-snapshotted-02"]
  description          = "A nice and very informative description for the snapshots."
  memory               = true
  quiesce              = true
  remove_children      = false
  consolidate          = true
}