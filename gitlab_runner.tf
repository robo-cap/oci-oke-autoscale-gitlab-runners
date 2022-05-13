## Copyright (c) 2022, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "local_file" "gitlab_runner_installer" {
  count       = var.gitlab_runner_instances
  content     = templatefile("${path.module}/templates/installGitlabRunner.template", {
    namespace             = var.gitlab_runner_namespace,
    gitlab_runner_name    = format("gr-%s", "0"),
    values                = concat(local.gr_values, tolist(["runnerRegistrationToken=${var.gitlab_runner_token}", "runners.name=runner${count.index}", "runners.tags=\"runner${count.index}\""])),
    config                = local.gr_config
  })
  filename    = format("install_gitlab-runner_%s.sh", count.index)
}


resource null_resource "install_gitlab_runner" {
  count     = var.gitlab_runner_instances
  
  provisioner "local-exec" {
    command = "chmod +x install_gitlab-runner_${count.index}.sh"
  }

  provisioner "local-exec" {
    command = "/bin/bash install_gitlab-runner_${count.index}.sh"
  }
  depends_on = [local_file.gitlab_runner_installer, null_resource.deploy_autoscaler]
}
