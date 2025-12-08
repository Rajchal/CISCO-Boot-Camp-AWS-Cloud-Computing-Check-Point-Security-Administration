## EC2 Linux Setup 

Steps to start a ec2 instance and start an httpd service for testing:

### Prerequisites
- AWS CLI configured with appropriate credentials
- VPC and security group created
- EC2 key pair available

### Launch EC2 Instance

```bash
#!/bin/bash

# Variables
INSTANCE_TYPE="t3.micro"
IMAGE_ID="ami-0c55b159cbfafe1f0"  # Amazon Linux 2
KEY_NAME="your-key-pair"
SECURITY_GROUP="your-security-group"
SUBNET_ID="your-subnet-id"

# Launch instance
aws ec2 run-instances \
    --image-id $IMAGE_ID \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids $SECURITY_GROUP \
    --subnet-id $SUBNET_ID \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=WebServer}]'
```

### Start HTTPD Service

```bash
#!/bin/bash

# Connect to instance and install httpd
ssh -i "your-key.pem" ec2-user@your-instance-ip << 'EOF'
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Server Running</h1>" | sudo tee /var/www/html/index.html
EOF
```

