# GitHub Self-Hosted Runners

This document describes the self-hosted GitHub Actions runners deployed in the homelab environment.

## Overview

The homelab uses self-hosted GitHub Actions runners to enable CI/CD workflows that require access to internal homelab resources. These runners are deployed as Proxmox LXC containers and are provisioned using OpenTofu.

## Bootstrap Process

> **IMPORTANT**: The GitHub runner infrastructure is the only component that must be manually deployed, as it creates a bootstrap dependency: the runners themselves will be used to deploy all other infrastructure.

### Deployment Process

To deploy the GitHub runners:

```bash
# From the repository root
task deploy-gh-runner
```

This task will:
1. Initialize the OpenTofu configuration
2. Apply the configuration to create the runner containers
3. Configure the runners to connect to GitHub
4. Output the connection details for the runners

### Manual Steps Required

Before running the deployment:

1. Create a GitHub Personal Access Token (PAT) with `administration:write` permissions on the repo
2. Add the token to your `terraform.tfvars` file:
   ```hcl
   gh_runners_pat = "your-token-here"
   ```

## Infrastructure Details

The GitHub runner setup consists of:

- **LXC containers**: For redundancy and parallel job execution
- **Non-root execution**: Runners operate as a dedicated `github-runner` user
- **Docker support**: For containerized workflow execution
- **Automatic registration**: Runners self-register with GitHub on startup

## Maintenance

### Updating Runners

To update the GitHub runner software:

1. Destroy the existing runners: `task destroy-gh-runner`
2. Update the runner version in the template file
3. Redeploy the runners: `task deploy-gh-runner`

### Troubleshooting

Common issues and their solutions:

- **Runner not connecting**: Check network connectivity and GitHub PAT validity
- **Job failures**: Review runner logs at `/home/github-runner/actions-runner/_diag/`
- **Container issues**: Check Proxmox logs and container status

## Implementation Details

The GitHub runner infrastructure is defined in:

- `/tofu/proxmox/github-runner/`: Root module configuration
- `/tofu/proxmox/modules/github-runner/`: Reusable module for runner deployment

Key files:
- `main.tf`: Defines the runner infrastructure
- `variables.tf`: Configurable parameters
- `templates/install-gh-runner.sh`: Runner installation script

## Limitations and Future Improvements

Current limitations:
- Runners must be manually deployed before other infrastructure
- No automatic updates of runner software

Planned improvements:
- Automated updates
