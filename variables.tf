variable "create" {
  type    = bool
  default = "true"
}
variable "instance_count" {
  type    = number
  default = "1"
}
variable "name" {
    type = string
}
variable "vapp_name" {
  type = string
}
variable "catalog_name" {
    type = string
}
variable "template_name" {
  type = string
}
variable "memory" {
  type = number
  default = "2048"
}
variable "cpus" {
  type = number
  default = "2"
}
variable "cpu_cores" {
  type = number
  default = "1"
}
variable "default_metadata" {
  type    = map(string)
  default = {}
}
variable "network" {
  type  = list(map(string))
}
variable "depends" {
  type    = list(string)
  default = []
}
variable "use_num_suffix" {
  type    = bool
  default = false
}
variable "initscript" {
  type    = string
  default = ""  
}
##
variable "independent_disk" {
  type  = bool
  default = "true"
}
variable "disks_name" {
  type  = string
  default = ""
}
variable "size" {
  type    = number
  default = "2048"
}
variable "bus_type" {
  type    = string
  default = "SCSI"
}
variable "bus_sub_type" {
  type    = string
  default = "lsilogic"
  description = "Disk bus subtype. Values can be: buslogic, lsilogic, lsilogicsas, VirtualSCSI for SCSI and ahci for SATA"
}
variable "storage_profile" {
  type    = string
  default = ""
}