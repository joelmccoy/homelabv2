output "runners" {
  description = "Information about all GitHub runners"
  value = {
    for key, runner in module.github_runner : key => {
      hostname         = runner.hostname
      ip_address       = runner.ip_address
      private_key_path = runner.private_key_path
      random_suffix    = runner.random_suffix
    }
  }
}
