module "vsphere_vm" {
  source = "git::https://github.com/armagankaratosun/terraform-vsphere-awesome-modules.git//modules/virtual-machine"

  vsphere_datastore = "<your-datastore>"
  vsphere_datacenter = "<your-datacenter>"
  vsphere_compute_cluster = "<your-cluster>"
  vsphere_networks = ["vlan-0", "vlan-10"]
  
  vm_name = ["vm-1", "vm-2"]
  vsphere_virtual_machine_template = "<your-vm-template>"
  vm_volumes = {
    boot = {
        label = "disk0"
        size  = 30
        thin_provisioned = false
        unit_number      = 0

    }
    data = {
        label = "disk1"
        size = 100
        thin_provisioned = true
        unit_number      = 1

    }
  }
  cloud_init_data = file("<path-to-your-cloud-init-yaml>")
}