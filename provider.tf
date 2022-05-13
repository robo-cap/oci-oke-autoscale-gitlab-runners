// Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


#################################################################################
###Unconmment below providers when deploying outside of OCI resource manager#####
#################################################################################
# provider "oci" {
#   tenancy_ocid          = var.tenancy_ocid
#   region                = var.region
#   user_ocid             = var.user_ocid
#   private_key_path      = var.private_key_path
#   fingerprint           = var.fingerprint 
# }

# provider "oci" {
#   tenancy_ocid          = var.tenancy_ocid
#   user_ocid             = var.user_ocid
#   fingerprint           = var.fingerprint 
#   private_key_path      = var.private_key_path
#   region                = data.oci_identity_regions.existing.regions[0].name
#   alias                 = "home"
# }

#################################################################################

provider "oci" {
  tenancy_ocid          = var.tenancy_ocid
  region                = var.region
}

provider "oci" {
  tenancy_ocid          = var.tenancy_ocid
  region                = data.oci_identity_regions.existing.regions[0].name
  alias                 = "home"
}