# AWS ELB with Auto Scaling Group Guide

## Overview
This guide covers setting up Elastic Load Balancing (ELB) with Auto Scaling Groups for high-availability applications on AWS.

## Prerequisites
- AWS Account
- AWS CLI configured
- Basic understanding of EC2, VPC, and security groups

## Architecture Components
- **Elastic Load Balancer**: Distributes incoming traffic
- **Auto Scaling Group**: Automatically manages EC2 instances
- **Launch Configuration/Template**: Defines instance specifications

## Setup Steps

### 1. Create a Launch Template
```bash
aws ec2 create-launch-template \
    --launch-template-name my-template \
    --version-description "Initial version" \
    --launch-template-data '{"ImageId":"ami-0c55b159cbfafe1f0","InstanceType":"t2.micro"}'
```

### 2. Create a Load Balancer
```bash
aws elbv2 create-load-balancer \
    --name my-alb \
    --subnets subnet-12345678 subnet-87654321
```

### 3. Create Auto Scaling Group
```bash
aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name my-asg \
    --launch-template LaunchTemplateName=my-template \
    --min-size 2 \
    --max-size 6 \
    --desired-capacity 3 \
    --vpc-zone-identifier "subnet-12345678,subnet-87654321"
```

## Scaling Policies
Configure target tracking or step scaling based on CloudWatch metrics.

## Monitoring
Use CloudWatch for metrics like CPU utilization, request count, and active connections.

## Best Practices
- Use multiple availability zones
- Configure health checks
- Monitor scaling events
- Implement proper logging
