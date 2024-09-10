variable "region" {
  type        = string
  description = "Oracle region name"
  default     = "eu-zurich-1"

}

variable "compartment_id" {
  type        = string
  description = "Oracle Cloud Compartment ID under the Tennacy"
  //default     = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"

}

variable "instance_displayname" {
  type        = string
  description = "Oracle Cloud Instance display name"
  default     = "adai_demo_instance_example"

}

variable "instance_size" {
  type        = string
  description = "Oracle Cloud Instance size"
  default     = "VM.Standard.E4.Flex"

}