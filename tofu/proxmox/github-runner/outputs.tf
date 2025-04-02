output "runner_1" {
  description = "Information about GitHub runner 1"
  value = {
    hostname         = module.github_runner_1.hostname
    ip_address       = module.github_runner_1.ip_address
    private_key_path = module.github_runner_1.private_key_path
    random_suffix    = module.github_runner_1.random_suffix
  }
}

output "runner_2" {
  description = "Information about GitHub runner 2"
  value = {
    hostname         = module.github_runner_2.hostname
    ip_address       = module.github_runner_2.ip_address
    private_key_path = module.github_runner_2.private_key_path
    random_suffix    = module.github_runner_2.random_suffix
  }
}
