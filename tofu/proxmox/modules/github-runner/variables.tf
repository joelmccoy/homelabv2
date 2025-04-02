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

variable "gh_runners_pat" {
  description = "GitHub PAT for creating runners, needs administration:write on the target repo"
  type        = string
  sensitive   = true
}

variable "vmid" {
  description = "VM ID for the container"
  type        = number
}

variable "ip_address" {
  description = "IP address for the container"
  type        = string
}

variable "ip_mask" {
  description = "IP mask for the container (e.g., /24)"
  type        = string
  default     = "/24"
}

variable "gateway" {
  description = "Gateway IP address"
  type        = string
  default     = "192.168.1.1"
}

variable "network_interface" {
  description = "Network interface name"
  type        = string
  default     = "veth0"
}

variable "datastore_id" {
  description = "Datastore ID for the container disk"
  type        = string
  default     = "local-lvm"
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 20
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "memory_mb" {
  description = "Memory in MB"
  type        = number
  default     = 2048
}

variable "template_url" {
  description = "URL for the container template"
  type        = string
  default     = "http://download.proxmox.com/images/system/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

variable "startup_order" {
  description = "Startup order"
  type        = string
  default     = "3"
}

variable "startup_up_delay" {
  description = "Startup up delay in seconds"
  type        = string
  default     = "60"
}

variable "startup_down_delay" {
  description = "Startup down delay in seconds"
  type        = string
  default     = "60"
}
