
module "adai_vcn" {
  source = "./modules/adai_vcn"
  //how do you call a variable from the root module and pass that to the child module 
  //this copartment id which is used in this root moudle who do you pass this to adai_vcn module 
}

resource "oci_core_instance" "instance" {
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  compartment_id = var.compartment_id
  display_name = var.instance_displayname
  shape = var.instance_size


  source_details {
    source_type = "image"
    source_id   = "ocid1.image.oc1.eu-zurich-1.aaaaaaaameaqzqjwp45epgv2zywkaw2cxutz6gdc6jxnrrbb4ciqpyrnkczq"
  }

  shape_config {
    ocpus         = 4
    memory_in_gbs = 28
  }

  create_vnic_details {
    subnet_id        = module.adai_vcn.subnet_id
    assign_public_ip = false
  }
}


resource "oci_core_volume" "additional_storage" {
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  compartment_id      = var.compartment_id
  display_name        = "additional_storage"
  size_in_gbs         = 80
}




resource "oci_core_volume_attachment" "os_volume_attachment" {
  instance_id     = oci_core_instance.instance.id
  volume_id       = oci_core_volume.additional_storage.id
  attachment_type = "paravirtualized"
}



resource "oci_core_volume" "os_volume" {

  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  compartment_id      = var.compartment_id
  display_name        = "os_volume"
  size_in_gbs         = 300
}

resource "oci_core_volume_attachment" "os_volume_attachment1" {
  instance_id     = oci_core_instance.instance.id
  volume_id       = oci_core_volume.os_volume.id
  attachment_type = "paravirtualized"
}


/*
module "adai_volume" {
  source = "./modules/adai_volume"
}*/

