# One click gitlab runner deployment to OKE with node pool autoscaler enabled

## Prerequisites:

1. OCI account with rights to:
    - manage dynamic groups
    - manage policies
    - manage network resources
    - manage OKE clusters
    - manage compute resources
    - manage resource manager service

    **Note:** 

    - If you don't have access to an OCI tenancy you can register [here](https://www.oracle.com/cloud/free/) for a free trial.
    
    - In case you plan to use existing OCI network resources, make sure [these](https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengnetworkconfig.htm#securitylistconfig) requirements are met.

2. Gitlab account.
    - required for Gitlab Runner registration token

## Deployment:

You may use below link and take advantage of one click deployment to Oracle Cloud via OCI Resource Manager Service.

[![Deploy to OCI](https://docs.oracle.com/en-us/iaas/Content/Resources/Images/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/robo-cap/oci-oke-autoscale-gitlab-runners/archive/refs/tags/v0.0.2.zip)