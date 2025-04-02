# bootstrap

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0, < 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0, < 6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_oidc_github"></a> [aws\_oidc\_github](#module\_aws\_oidc\_github) | unfunco/oidc-github/aws | v1.8.1 |
| <a name="module_lock_table"></a> [lock\_table](#module\_lock\_table) | terraform-aws-modules/dynamodb-table/aws | 4.3.0 |
| <a name="module_state_bucket"></a> [state\_bucket](#module\_state\_bucket) | terraform-aws-modules/s3-bucket/aws | 4.6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_document.terraform_state_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | The prefix to apply to the s3 state bucket name | `string` | `"homelabv2-tf-state-"` | no |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | The name of the dynamodb table to create for state locking | `string` | `"homelabv2-tf-state-lock"` | no |
| <a name="input_github_oidc_role_name"></a> [github\_oidc\_role\_name](#input\_github\_oidc\_role\_name) | The name of the role to create for github oidc | `string` | `"github-oidc-role"` | no |
| <a name="input_github_repositories"></a> [github\_repositories](#input\_github\_repositories) | The list of github repositories to grant access to in the IAM OIDC role | `list(string)` | <pre>[<br/>  "joelmccoy/homelab2"<br/>]</pre> | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
