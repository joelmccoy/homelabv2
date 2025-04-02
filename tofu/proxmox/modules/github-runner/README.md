# github-runner

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2.5 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | ~> 0.74 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | ~> 2.5 |
| <a name="provider_null"></a> [null](#provider\_null) | ~> 3.2 |
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | ~> 0.74 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.6 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [null_resource.setup_github_actions_runner](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [proxmox_virtual_environment_container.github_actions_runner](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_container) | resource |
| [proxmox_virtual_environment_download_file.ubuntu_lxc_template](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_download_file) | resource |
| [random_password.github_actions_runner_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_string.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [tls_private_key.github_actions_runner_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_cores"></a> [cpu\_cores](#input\_cpu\_cores) | Number of CPU cores | `number` | `2` | no |
| <a name="input_datastore_id"></a> [datastore\_id](#input\_datastore\_id) | Datastore ID for the container disk | `string` | `"local-lvm"` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Disk size in GB | `number` | `20` | no |
| <a name="input_gateway"></a> [gateway](#input\_gateway) | Gateway IP address | `string` | `"192.168.1.1"` | no |
| <a name="input_gh_runners_pat"></a> [gh\_runners\_pat](#input\_gh\_runners\_pat) | GitHub PAT for creating runners, needs administration:write on the target repo | `string` | n/a | yes |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | IP address for the container | `string` | n/a | yes |
| <a name="input_ip_mask"></a> [ip\_mask](#input\_ip\_mask) | IP mask for the container (e.g., /24) | `string` | `"/24"` | no |
| <a name="input_memory_mb"></a> [memory\_mb](#input\_memory\_mb) | Memory in MB | `number` | `2048` | no |
| <a name="input_network_interface"></a> [network\_interface](#input\_network\_interface) | Network interface name | `string` | `"veth0"` | no |
| <a name="input_proxmox"></a> [proxmox](#input\_proxmox) | Proxmox provider configuration | <pre>object({<br/>    name         = string<br/>    cluster_name = string<br/>    endpoint     = string<br/>    insecure     = bool<br/>    username     = string<br/>  })</pre> | n/a | yes |
| <a name="input_startup_down_delay"></a> [startup\_down\_delay](#input\_startup\_down\_delay) | Startup down delay in seconds | `string` | `"60"` | no |
| <a name="input_startup_order"></a> [startup\_order](#input\_startup\_order) | Startup order | `string` | `"3"` | no |
| <a name="input_startup_up_delay"></a> [startup\_up\_delay](#input\_startup\_up\_delay) | Startup up delay in seconds | `string` | `"60"` | no |
| <a name="input_template_url"></a> [template\_url](#input\_template\_url) | URL for the container template | `string` | `"http://download.proxmox.com/images/system/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"` | no |
| <a name="input_vmid"></a> [vmid](#input\_vmid) | VM ID for the container | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hostname"></a> [hostname](#output\_hostname) | Hostname of the GitHub runner |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | IP address of the GitHub runner |
| <a name="output_password"></a> [password](#output\_password) | Password for the root user |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | Private key for SSH access |
| <a name="output_private_key_path"></a> [private\_key\_path](#output\_private\_key\_path) | Path to the private key file |
| <a name="output_random_suffix"></a> [random\_suffix](#output\_random\_suffix) | Random suffix used for the runner |
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
