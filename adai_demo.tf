terraform {
  required_version = "~> 1.5"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.46.0"
    }
  }
}
variable fingerprint {
  default = "9f:23:85:d6:4b:a3:9d:82:b7:a6:dd:9e:ef:31:da:ba"
}

variable "private_key_path" {
  type    = string
  default = "/c/Users/u005741/.oci/oci_api_key.pem"
}


data "oci_identity_availability_domains" "ad" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"
}

resource "oci_core_vcn" "vcn" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"
  display_name   = "DB_Demo_VCN"
  cidr_block     = "10.6.0.0/16"
}

resource "oci_core_subnet" "subnet" {
  compartment_id      = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"
  vcn_id              = oci_core_vcn.vcn.id
  display_name        = "DB_Demo_Subnet"
  cidr_block          = "10.6.1.0/24"
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
}

resource "oci_core_instance" "instance" {
  count = 6
  availability_domain    = data.oci_identity_availability_domains.ad.availability_domains[0].name
  compartment_id = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"
  display_name   = "E4d_v5_instance_${count.index + 1}"
  shape          = "E4d_v5"

  source_details {
    source_type = "image"
    source_id   = "ocid1.image.oc1.eu-zurich-1.aaaaaaaameaqzqjwp45epgv2zywkaw2cxutz6gdc6jxnrrbb4ciqpyrnkczq"
  }

  shape_config {
    ocpus         = 4
    memory_in_gbs = 20
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet.id
    assign_public_ip = false
  }

  /*
  metadata = {
    ssh_authorized_keys = file("~/.oci/rsa_public.pem")
  }
*/
}

resource "oci_core_volume" "additional_storage" {
  count               = 6
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  compartment_id      = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"
  display_name        = "additional_storage_${count.index + 1}"
  size_in_gbs         = 80
}

resource "oci_core_volume_attachment" "os_volume_attachment" {
  count          = 6
  instance_id   = oci_core_instance.instance[count.index].id
  volume_id     = oci_core_volume.os_volume[count.index].id
  attachment_type = "paravirtualized"
}



resource "oci_core_volume" "os_volume" {
  count               = 6
  availability_domain = data.oci_identity_availability_domains.ad.availability_domains[0].name
  compartment_id      = "ocid1.compartment.oc1..aaaaaaaadis5qo2o7lqsbdw7ndk2pn2njv3ciyhcvmqdxttfuyxm7dczgvaq"
  display_name        = "os_volume_${count.index + 1}"
  size_in_gbs         = 300
}

