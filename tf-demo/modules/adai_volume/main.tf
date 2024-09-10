
/*
resource "oci_core_volume" "additional_storage" {
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  compartment_id      = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"
  display_name        = "additional_storage"
  size_in_gbs         = 80
}




resource "oci_core_volume_attachment" "os_volume_attachment" {
  instance_id     = oci_core_instance.instance.id
  volume_id       = oci_core_volume.os_volume.id
  attachment_type = "paravirtualized"
}



resource "oci_core_volume" "os_volume" {
  
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  compartment_id      = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"
  display_name        = "os_volume"
  size_in_gbs         = 300
}
*/