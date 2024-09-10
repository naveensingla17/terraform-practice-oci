resource "oci_core_vcn" "vcn" {
  //compartment_id = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"
  compartment_id = var.compartment_id
  display_name   = "DB_Demo_VCN"
  cidr_block     = "10.6.0.0/16"
}

resource "oci_core_subnet" "subnet" {
  compartment_id      = var.compartment_id
  vcn_id              = oci_core_vcn.vcn.id
  display_name        = var.subnet_display_nasme
  cidr_block          = "10.6.1.0/24"
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
}



