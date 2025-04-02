# 4. Use S3 Backend for OpenTofu State

Date: 2025-04-02

## Status

Accepted

## Context

OpenTofu (and Terraform) by default stores state locally in a `terraform.tfstate` file. This approach presents several challenges in a team environment and for critical infrastructure:

- **Collaboration issues**: Local state files make it difficult for multiple team members to work on the same infrastructure
- **State file loss risk**: Local state files can be accidentally deleted or corrupted
- **No locking mechanism**: Concurrent operations can lead to state file corruption or race conditions
- **Security concerns**: State files may contain sensitive information stored on local machines

The homelab infrastructure is managed declaratively through code in the `infra/` directory using OpenTofu, as noted in previous architectural decisions. As the infrastructure grows more complex, a more robust state management solution is needed.

## Decision

We will use AWS S3 as a remote backend for storing OpenTofu state files with the following configuration:

- An S3 bucket with versioning enabled to store state files
- Server-side encryption using KMS for securing state data
- A DynamoDB table for state locking to prevent concurrent operations
- GitHub OIDC integration for secure access to the state backend from CI/CD workflows

The backend infrastructure itself is provisioned in `/aws/bootstrap` and will be used by all OpenTofu code except the GitHub runners (which will continue to use local state due to their bootstrap nature).

## Rationale

- ✅ **Centralized state storage**: S3 provides a reliable, centralized location for state files
- ✅ **State locking**: DynamoDB enables state locking to prevent concurrent operations that could corrupt state
- ✅ **Improved security**: Server-side encryption protects sensitive information in state files
- ✅ **Version history**: S3 versioning allows recovery from accidental state changes or corruption
- ✅ **Team collaboration**: Remote state enables multiple team members to work on infrastructure safely
- ✅ **CI/CD integration**: GitHub Actions can securely access state via OIDC without long-lived credentials

## Consequences

- The S3 state backend must be provisioned before other infrastructure can be deployed
- AWS credentials must be managed securely for local development
- There is a small cost associated with S3 storage and DynamoDB
- GitHub runners will continue to use local state as an exception to this pattern
- All other OpenTofu configurations must be updated to use the S3 backend
- The state backend represents a critical piece of infrastructure that must be carefully managed
