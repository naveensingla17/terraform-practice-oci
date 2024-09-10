/*
module "adai_vcn" {
  source = "./modules/adai_vcn"
}

resource "oci_core_instance" "instance" {
  //count               = 1
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  compartment_id      = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"
  display_name        = "adai_demo_instance"
  shape               = "VM.Standard.E4.Flex"
   

  source_details {
    source_type = "image"
    source_id   = "ocid1.image.oc1.eu-zurich-1.aaaaaaaameaqzqjwp45epgv2zywkaw2cxutz6gdc6jxnrrbb4ciqpyrnkczq"
  }  

  shape_config {
    ocpus         = 4
    memory_in_gbs = 18
  }

  create_vnic_details {
    subnet_id        = module.adai_vcn.subnet_id
    assign_public_ip = false
  } 
} */