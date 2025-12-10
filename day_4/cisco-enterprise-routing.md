
# Cisco Enterprise Routing Architecture

## Overview
This document describes an enterprise routing topology implemented in Cisco Packet Tracer with multiple interconnected subnets and routing protocols.

## Network Topology

### Core Layer
- **Router (Core)**: Central routing hub connecting all major network segments
    - Manages traffic between data center, branch offices, and remote sites
    - Implements routing policies and security controls

### Distribution Layer
- **Router 1 (S-IT)**: Connects Server farm and IT infrastructure
- **Router 2 (Router2)**: Manages branch office connectivity
- **Router 3 (S-GIS)**: Handles specialized network segments

### Access Layer
- **Multiple Switches (S-IT, S-GIS, etc.)**: Connect end devices
- **Laptops/PCs**: End-user devices across locations
- **Servers**: Database and application servers
- **Printer**: Network printer resource

## Network Connections

| Layer | Device | Purpose |
|-------|--------|---------|
| Core | Router-HQ | Enterprise backbone |
| Distribution | S-IT, Router2, S-GIS | Regional connectivity |
| Access | Switches | End-device connectivity |

## Routing Protocol
- Static or Dynamic routing (OSPF/EIGRP recommended)

## IP Addressing Scheme
- Plan subnets for each branch office
- Document gateway IPs for each segment
- Reserve server addresses in data center subnet
