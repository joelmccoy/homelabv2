# IP Reservations

This document tracks all reserved IP addresses in the homelab environment to prevent conflicts and provide documentation for network planning.

## Network Information

- **Network**: 192.168.1.0/24
- **Gateway**: 192.168.1.1
- **DNS Servers**: 192.168.1.1

## Reserved IP Addresses

| IP Address | Hostname/Description | Type | Purpose | VMID (if applicable) |
|------------|----------------------|------|---------|----------------------|
| 192.168.1.1 | Router/Gateway | Physical | Network gateway and DNS | N/A |
| 192.168.1.250 | pve | Physical | Proxmox VE host | N/A |
| 192.168.1.150 | github-actions-runner-* | LXC Container | GitHub Actions Runner 0 | 9000 |
| 192.168.1.151 | github-actions-runner-* | LXC Container | GitHub Actions Runner 1 | 9001 |

## IP Allocation Strategy

- **1-149**: Reserved for network infrastructure and manually configured devices
- **150-199**: Services and containers
- **200-249**: Virtual machines
- **250-254**: Physical Proxmox servers

## Notes

- New IP reservations should be documented in this file
- VM and container IPs should be defined in the corresponding Terraform/OpenTofu configuration

## Future Considerations

- Potential subnet segmentation for different service types
- VLANs for network isolation
