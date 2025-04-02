# 3. Use GitHub Private Runners

Date: 2025-04-01

## Status

Accepted

## Context

For effective CI/CD in the homelab environment, we need GitHub Actions runners that have direct access to the internal homelab network. This access is essential for:

Deploying infrastructure changes to Proxmox and other internal services

Public GitHub-hosted runners cannot access our private network, and setting up complex VPN tunnels introduces unnecessary complexity and potential security issues.

## Decision

We will deploy self-hosted GitHub Actions runners within the homelab network using OpenTofu to automate their provisioning and configuration. These runners will be deployed as Proxmox containers with:

- Direct access to the internal homelab network
- Appropriate permissions to manage infrastructure
- Docker support for running containerized workflows
- Automatic registration with GitHub

## Rationale

- ✅ Self-hosted runners provide direct, secure access to internal homelab resources
- ✅ Runners can be provisioned and configured in a repeatable, code-driven manner
- ✅ Using Proxmox containers provides isolation while being resource-efficient
- ✅ Multiple runners can be deployed for redundancy and parallel job execution
- ✅ Runners can be rebuilt easily if they become corrupted or outdated

## Consequences

- The GitHub runner infrastructure must be bootstrapped manually before other infrastructure can be deployed, creating a "chicken and egg" situation
- We need to manage GitHub PAT tokens securely for runner registration
- Runners need to be periodically updated to maintain security and compatibility
- We must ensure proper security isolation for the runners, as they will have access to sensitive infrastructure
- The runners represent a critical piece of infrastructure that, if compromised, could affect the entire homelab
