# Enterprise LAN Setup Guide

## Overview
This guide covers the essential steps to design and implement a Cisco enterprise LAN infrastructure with focus on VLAN management and inter-VLAN routing.

## Prerequisites
- Cisco switches: DIST-SW-01, ACC-SW-01, ACC-SW-02
- Network management tools
- Basic networking knowledge

## Key Components

### 1. VLAN Database Configuration
Configure the VLAN database on DIST-SW-01:
```bash
vlan database
vlan 10 name Management
vlan 20 name Finance
vlan 30 name Operations
exit
```

### 2. VTP Mode Setup
- **DIST-SW-01 (Server)**: `vtp mode server`
- **ACC-SW-01, ACC-SW-02 (Clients)**: `vtp mode client`

```bash
vtp mode server
vtp domain enterprise-lan
vtp password cisco123
```

### 3. VLAN Tagging
Configure trunk links with 802.1Q tagging:
```bash
interface gi0/1
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30
```

### 4. Inter-VLAN Routing
```bash
interface vlan 10
 ip address 192.168.10.1 255.255.255.0
interface vlan 20
 ip address 192.168.20.1 255.255.255.0
interface vlan 30
 ip address 192.168.30.1 255.255.255.0
```

## Best Practices
- Document all VLAN assignments
- Implement redundancy for trunk links
- Monitor VTP synchronization
- Regular backups of VLAN database

