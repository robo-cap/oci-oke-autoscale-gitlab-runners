# One click gitlab runner deployment to OKE with node pool autoscaler enabled

## Prerequisites:
### User required rights:
 - manage defined tags
 - manage dynamic groups
 - manage compartment policies
 - manage networking resources
 - manage oke resources
 - manage compute resurces

### In case of custom networking setup, make sure [these](https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengnetworkconfig.htm#securitylistconfig) requirements are met


## One click deployment via OCI Resource Manager:

[![Deploy to OCI](https://docs.oracle.com/en-us/iaas/Content/Resources/Images/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/robo-cap/oci-oke-autoscale-gitlab-runners/archive/refs/tags/v0.0.1.zip)