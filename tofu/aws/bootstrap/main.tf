module "state_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.6.0"

  bucket_prefix = var.bucket_prefix

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning = {
    status     = true
    mfa_delete = false
  }
}

module "lock_table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "4.3.0"

  name     = var.dynamodb_table_name
  hash_key = "LockID"

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]

  point_in_time_recovery_enabled = true
}

module "aws_oidc_github" {
  source  = "unfunco/oidc-github/aws"
  version = "v1.8.1"

  create_oidc_provider    = true
  github_repositories     = var.github_repositories
  iam_role_name           = var.github_oidc_role_name
  attach_read_only_policy = false

  iam_role_inline_policies = {
    "terraform_state_access" = data.aws_iam_policy_document.terraform_state_access.json
  }
}

data "aws_iam_policy_document" "terraform_state_access" {
  statement {
    sid    = "S3StateAccess"
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = [
      module.state_bucket.s3_bucket_arn,
      "${module.state_bucket.s3_bucket_arn}/*"
    ]
  }

  statement {
    sid    = "DynamoDBLockAccess"
    effect = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"
    ]
    resources = [module.lock_table.dynamodb_table_arn]
  }
}
