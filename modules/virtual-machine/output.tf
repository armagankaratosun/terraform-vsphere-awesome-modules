output "vm_ip" {
  value = vsphere_virtual_machine.vm.*.guest_ip_addresses
}

output "vm_name" {
  value = vsphere_virtual_machine.vm.*.name
}

output "vm_id" {
  value = vsphere_virtual_machine.vm.*.guest_id
}
