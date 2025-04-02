module "github_runner_1" {
  source = "../modules/github-runner"

  proxmox        = var.proxmox
  gh_runners_pat = var.gh_runners_pat

  vmid       = 201
  ip_address = "192.168.1.150"
  gateway    = "192.168.1.1"

  # Optional parameters with defaults
  # cpu_cores  = 2
  # memory_mb  = 2048
  # disk_size  = 20
}

module "github_runner_2" {
  source = "../modules/github-runner"

  proxmox        = var.proxmox
  gh_runners_pat = var.gh_runners_pat

  vmid       = 202
  ip_address = "192.168.1.151"
  gateway    = "192.168.1.1"

  # Optional parameters with defaults
  # cpu_cores  = 2
  # memory_mb  = 2048
  # disk_size  = 20
}
