locals {
  github_runners = {
    runner0 = {
      vmid       = 9000
      ip_address = "192.168.1.150"
      gateway    = "192.168.1.1"
      memory_mb  = 2048
      disk_size  = 20
    }
    runner1 = {
      vmid       = 9001
      ip_address = "192.168.1.151"
      gateway    = "192.168.1.1"
      memory_mb  = 2048
      disk_size  = 20
    }
  }
}

module "github_runner" {
  source   = "../modules/github-runner"
  for_each = local.github_runners

  proxmox        = var.proxmox
  gh_runners_pat = var.gh_runners_pat

  vmid       = each.value.vmid
  ip_address = each.value.ip_address
  gateway    = each.value.gateway
  memory_mb  = each.value.memory_mb
  disk_size  = each.value.disk_size
}
