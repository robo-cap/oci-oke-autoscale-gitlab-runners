// Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_identity_dynamic_group" "instance_principal_dg" {
  provider       = oci.home
  compartment_id = var.tenancy_ocid
  description    = "Dynamic group for worker nodes in OKE cluster"
  matching_rule  = "ALL {instance.compartment.id = '${var.compartment_id}', tag.oke.autoscaler.value = 'true'}"
  name           = "OKE_autoscaler_DG"
}

resource "oci_identity_policy" "this" {
  provider       = oci.home
  compartment_id = var.compartment_id
  description    = "Policy to enable OKE cluster autoscaling"
  name           = "oke_autoscaler_instances"
  statements     = ["Allow dynamic-group ${oci_identity_dynamic_group.instance_principal_dg.name} to manage cluster-node-pools in compartment ${data.oci_identity_compartment.home_compartment.name}",
"Allow dynamic-group ${oci_identity_dynamic_group.instance_principal_dg.name} to manage instance-family in compartment ${data.oci_identity_compartment.home_compartment.name}",
"Allow dynamic-group ${oci_identity_dynamic_group.instance_principal_dg.name} to use subnets in compartment ${data.oci_identity_compartment.home_compartment.name}",
"Allow dynamic-group ${oci_identity_dynamic_group.instance_principal_dg.name} to use vnics in compartment ${data.oci_identity_compartment.home_compartment.name}",
"Allow dynamic-group ${oci_identity_dynamic_group.instance_principal_dg.name} to inspect compartments in compartment ${data.oci_identity_compartment.home_compartment.name}"]
}

resource "oci_identity_policy" "network_policies" {
  provider       = oci.home
  compartment_id = var.use_existing_networking ? data.oci_core_subnet.worker_subnet[0].compartment_id : var.compartment_id
  description    = "Policy to enable OKE cluster autoscaling"
  name           = "oke_autoscaler_networking"
  statements     = ["Allow dynamic-group ${oci_identity_dynamic_group.instance_principal_dg.name} to use subnets in compartment ${data.oci_identity_compartment.network_compartment.name}",
"Allow dynamic-group ${oci_identity_dynamic_group.instance_principal_dg.name} to read virtual-network-family in compartment ${data.oci_identity_compartment.network_compartment.name}",
"Allow dynamic-group ${oci_identity_dynamic_group.instance_principal_dg.name} to use vnics in compartment ${data.oci_identity_compartment.network_compartment.name}",
"Allow dynamic-group ${oci_identity_dynamic_group.instance_principal_dg.name} to inspect compartments in compartment ${data.oci_identity_compartment.network_compartment.name}"]
}
