output "vm_name" {
  value = vcd_vapp_vm.vapp_vm_with_disk.*.name
}
output "vm_ip" {
  value = vcd_vapp_vm.vapp_vm_with_disk.*.network 
}
