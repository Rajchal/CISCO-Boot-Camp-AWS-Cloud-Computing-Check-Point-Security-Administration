# AWS VPC Peering

## Overview
AWS VPC Peering is a networking connection between two Virtual Private Clouds (VPCs) that enables you to route traffic between them using private IPv4 or IPv6 addresses.

## Key Features
- **Private connectivity** between VPCs within or across AWS regions
- **No internet gateway or VPN** required
- **Low latency** and high bandwidth
- **Simple setup** with no single point of failure

## Use Cases
- Multi-tier application architectures
- Cross-environment communication (dev, staging, prod)
- Sharing resources across different AWS accounts
- Disaster recovery setups

## How It Works
1. Request a peering connection from VPC A to VPC B
2. Accept the peering connection in VPC B
3. Update route tables in both VPCs
4. Configure security groups and network ACLs

## Limitations
- VPCs must have non-overlapping CIDR blocks
- Transitive peering not supported (A↔B and B↔C doesn't mean A↔C)
- Cannot peer a VPC with itself
- Maximum MTU is 1500 bytes

## Best Practices
- Document all peering relationships
- Use descriptive names for peering connections
- Regularly audit route tables
- Monitor VPC Flow Logs for troubleshooting
- Plan CIDR blocks carefully to avoid conflicts

## Pricing
No additional charges for VPC peering itself. You only pay for data transfer across regions if applicable.
