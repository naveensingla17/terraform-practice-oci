terraform {
  required_version = "~> 1.5"

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.46.0"
    }
  }
}

provider "oci" {
  tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaa6yfgaxkv573qdjzpl5pyhlx4aqxgrkud5qz4jbsr4epujxepa7na"
  user_ocid    = "ocid1.user.oc1..aaaaaaaaxyvjopht3xedh6mg3mtar3unmbgqhtiungrg5hae7sacv4qplbwa"
  //fingerprint      = "your_fingerprint"
  //private_key_path = "path/to/your/private_key.pem"
  region = var.region
}
