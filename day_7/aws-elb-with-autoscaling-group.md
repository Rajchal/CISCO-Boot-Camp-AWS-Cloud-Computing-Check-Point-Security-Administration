
# AWS ELB with Auto Scaling Group

## Overview
Elastic Load Balancing (ELB) distributes incoming application traffic across multiple targets, while Auto Scaling Groups automatically adjust the number of EC2 instances based on demand.

## Key Components

### Elastic Load Balancer (ELB)
- **Application Load Balancer (ALB)**: Layer 7 (Application)
- **Network Load Balancer (NLB)**: Layer 4 (Transport)
- **Classic Load Balancer (CLB)**: Legacy, Layers 4-7

### Auto Scaling Group (ASG)
- Maintains desired number of instances
- Launches/terminates instances based on policies
- Integrates with CloudWatch metrics

## Basic Setup

```yaml
Load Balancer → Health Checks → ASG
    ↓
Target Group (EC2 instances)
    ↓
Scaling Policies (CPU, Memory, Custom)
```

## Common Use Cases
- High availability across multiple AZs
- Cost optimization through dynamic scaling
- Automatic recovery from instance failures

## Best Practices
1. Define appropriate min/max capacity
2. Set health check grace period
3. Use lifecycle hooks for graceful shutdown
4. Monitor with CloudWatch alarms
