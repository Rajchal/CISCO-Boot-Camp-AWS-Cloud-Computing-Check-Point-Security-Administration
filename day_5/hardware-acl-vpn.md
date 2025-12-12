
# Hardware Setup: Router and Switches for VPN and ACL

## Overview
Guide for configuring routers and switches to support VPN and Access Control Lists (ACL).

## Router Hardware Setup

### Requirements
- Enterprise-grade router (Cisco ASR, Juniper MX, etc.)
- Minimum 2 GB RAM
- Cryptographic acceleration module (optional)
- Multiple Gigabit Ethernet ports

### Installation Steps
1. Mount router in rack
2. Connect power supplies (dual redundancy recommended)
3. Install line cards for additional ports
4. Connect management console

## Switch Hardware Setup

### Requirements
- Managed Layer 3 switch
- VLAN support
- Minimum 48 ports
- PoE capability (optional)

### Installation Steps
1. Rack mount switch
2. Connect uplink to router
3. Connect access ports to devices
4. Connect console cable for initial config

## VPN Configuration Hardware

### IPsec VPN
- Hardware crypto accelerator
- VPN module (if separate)
- Sufficient throughput capacity

### Remote Access VPN
- VPN concentrator or integrated module
- SSL/TLS certificates
- Authentication servers (RADIUS/LDAP)

## ACL Implementation

- Deploy ACLs on router interfaces
- Use TCAM for hardware acceleration
- Plan IP address ranges for rules

## Connectivity Verification
```
show interfaces
show crypto session
show access-lists
```
