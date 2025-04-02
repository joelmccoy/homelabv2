variable "bucket_prefix" {
  description = "The prefix to apply to the s3 state bucket name"
  type        = string
  default     = "homelabv2-tf-state-"
}

variable "dynamodb_table_name" {
  description = "The name of the dynamodb table to create for state locking"
  type        = string
  default     = "homelabv2-tf-state-lock"
}

variable "github_oidc_role_name" {
  description = "The name of the role to create for github oidc"
  type        = string
  default     = "github-oidc-role"
}

variable "github_repositories" {
  description = "The list of github repositories to grant access to in the IAM OIDC role"
  type        = list(string)
  default     = ["joelmccoy/homelab2"]
}
