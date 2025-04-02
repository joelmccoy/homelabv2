output "hostname" {
  description = "Hostname of the GitHub runner"
  value       = local.hostname
}

output "ip_address" {
  description = "IP address of the GitHub runner"
  value       = var.ip_address
}

output "private_key_path" {
  description = "Path to the private key file"
  value       = local_file.private_key.filename
}

output "private_key" {
  description = "Private key for SSH access"
  value       = tls_private_key.github_actions_runner_key.private_key_pem
  sensitive   = true
}

output "password" {
  description = "Password for the root user"
  value       = random_password.github_actions_runner_password.result
  sensitive   = true
}

output "random_suffix" {
  description = "Random suffix used for the runner"
  value       = local.random_suffix
}
