## Create VM Instance with only one disk
resource "vcd_vapp_vm" "vapp_vm_with_disk" {
    count   = var.independent_disk ? var.instance_count : 0

    vapp_name       = var.vapp_name
    name            = var.instance_count > 1 || var.use_num_suffix ? format("%s-%d", var.name, count.index + 1) : var.name
    computer_name   = var.instance_count > 1 || var.use_num_suffix ? format("%s-%d", var.name, count.index + 1) : var.name
    catalog_name    = var.catalog_name
    template_name   = var.template_name
    memory          = var.memory
    cpus            = var.cpus
    cpu_cores       = var.cpu_cores 
    initscript      = var.initscript

    dynamic "network" {
        for_each = var.network
        content {
            type                = network.value.type
            name                = lookup(network.value, "name", "null")
            is_primary          = lookup(network.value, "is_primary", "false")
            ip_allocation_mode  = network.value.ip_allocation_mode
        }
    }
    disk {
        name        = element(vcd_independent_disk.new_disk.*.name, count.index)
        bus_number  = "1"
        unit_number = "0"
    }

    depends_on = [ var.depends, vcd_independent_disk.new_disk ]
    metadata        = var.default_metadata
}
resource "vcd_independent_disk" "new_disk" {
    count   = var.independent_disk ? var.instance_count : 0

    name              = var.instance_count > 1 || var.use_num_suffix ? format("%s-%d", var.disks_name, count.index + 1) : var.disks_name           
    size              = var.size
    bus_type          = var.bus_type
    storage_profile   = var.storage_profile
    bus_sub_type      = var.bus_sub_type
}