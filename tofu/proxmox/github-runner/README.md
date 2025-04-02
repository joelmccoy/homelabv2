# github-runner

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | ~> 2.5 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | ~> 0.74 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_github_runner_1"></a> [github\_runner\_1](#module\_github\_runner\_1) | ../modules/github-runner | n/a |
| <a name="module_github_runner_2"></a> [github\_runner\_2](#module\_github\_runner\_2) | ../modules/github-runner | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gh_runners_pat"></a> [gh\_runners\_pat](#input\_gh\_runners\_pat) | GitHub PAT for creating runners, needs administration:write on the target repo | `string` | n/a | yes |
| <a name="input_proxmox"></a> [proxmox](#input\_proxmox) | Proxmox provider configuration | <pre>object({<br/>    name         = string<br/>    cluster_name = string<br/>    endpoint     = string<br/>    insecure     = bool<br/>    username     = string<br/>  })</pre> | n/a | yes |
| <a name="input_proxmox_api_token"></a> [proxmox\_api\_token](#input\_proxmox\_api\_token) | Proxmox API token for authentication | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_runner_1"></a> [runner\_1](#output\_runner\_1) | Information about GitHub runner 1 |
| <a name="output_runner_2"></a> [runner\_2](#output\_runner\_2) | Information about GitHub runner 2 |
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
