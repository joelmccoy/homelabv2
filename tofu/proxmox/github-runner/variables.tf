variable "proxmox" {
  description = "Proxmox provider configuration"
  type = object({
    name         = string
    cluster_name = string
    endpoint     = string
    insecure     = bool
    username     = string
  })
}

variable "proxmox_api_token" {
  description = "Proxmox API token for authentication"
  type        = string
  sensitive   = true
}

variable "gh_runners_pat" {
  description = "GitHub PAT for creating runners, needs administration:write on the target repo"
  type        = string
  sensitive   = true
}
