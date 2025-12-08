# EC2 Linux Instance Setup via Console

## Prerequisites
- AWS account with appropriate IAM permissions
- VPC and security group configured
- Key pair created for SSH access

## Setup Steps

### 1. Launch Instance
1. Navigate to **EC2 Dashboard**
2. Click **Launch Instances**
3. Select an AMI (e.g., Amazon Linux 2, Ubuntu)
4. Choose instance type (e.g., t2.micro for free tier)
5. Click **Next: Configure Instance Details**

### 2. Configure Instance
1. Set number of instances
2. Select VPC and subnet
3. Enable auto-assign public IP if needed
4. Configure IAM role (optional)
5. Click **Next: Add Storage**

### 3. Add Storage
1. Configure root volume size (default: 8GB)
2. Set volume type (gp2 recommended)
3. Enable **Delete on Termination** if desired
4. Click **Next: Add Tags**

### 4. Add Tags
1. Add key-value pairs for identification
2. Example: `Name: MyEC2Instance`
3. Click **Next: Configure Security Group**

### 5. Configure Security Group
1. Select existing or create new security group
2. Add inbound rules:
    - SSH (port 22) from your IP
    - HTTP (port 80) if needed
    - HTTPS (port 443) if needed
3. Click **Review and Launch**

### 6. Review and Launch
1. Verify all settings
2. Click **Launch**
3. Select existing or create new key pair
4. Click **Launch Instances**

### 7. Connect to Instance
```bash
chmod 400 your-key.pem
ssh -i your-key.pem ec2-user@your-public-ip
```
