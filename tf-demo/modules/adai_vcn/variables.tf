

variable "compartment_id" {
    type = string
    description = "Oracle Cloud Compartment ID under the Tennacy"
    default = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"
  
} 



variable "subnet_display_nasme" {
    type = string
    description = "Oracle Cloud Subnet Display Name"
    default = "DB_Demo_Subnet"
  
}