# Deploying NAT in AWS - Full Guide

## Overview
Network Address Translation (NAT) allows EC2 instances in private subnets to access the internet while remaining unreachable from the internet.

## Prerequisites
- AWS Account with appropriate permissions
- VPC with public and private subnets
- Internet Gateway attached to VPC

## Types of NAT

### NAT Gateway (Recommended)
- AWS-managed, highly available
- Requires Elastic IP
- Deployed in public subnet
- Better performance and availability

### NAT Instance
- Self-managed EC2 instance
- More control but higher maintenance
- Single point of failure

## Steps to Deploy NAT Gateway

### 1. Allocate Elastic IP
```bash
aws ec2 allocate-address --domain vpc
```

### 2. Create NAT Gateway
- Navigate to VPC Dashboard → NAT Gateways
- Select public subnet
- Allocate the Elastic IP
- Wait for "Available" status

### 3. Update Route Tables
- Go to Route Tables
- Select private subnet's route table
- Add route: `0.0.0.0/0 → NAT Gateway ID`

### 4. Test Connectivity
Launch an EC2 instance in private subnet and verify outbound internet access.

## Best Practices
- Use NAT Gateways for production workloads
- Deploy NAT Gateways in multiple AZs for high availability
- Monitor NAT Gateway CloudWatch metrics
- Set up appropriate security groups

## Costs
- Hourly charges per NAT Gateway
- Data processing charges