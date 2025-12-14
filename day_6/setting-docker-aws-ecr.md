
# AWS Docker Setup

## Prerequisites
- AWS Account
- AWS CLI installed and configured
- Docker installed locally

## Steps

### 1. Create an EC2 Instance
```bash
aws ec2 run-instances \
    --image-id ami-0c55b159cbfafe1f0 \
    --instance-type t2.micro \
    --key-name your-key-pair
```

### 2. Connect to Instance
```bash
ssh -i your-key.pem ec2-user@your-instance-ip
```

### 3. Install Docker
```bash
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo usermod -aG docker ec2-user
```

### 4. Create ECR Repository
```bash
aws ecr create-repository --repository-name my-app --region us-east-1
```

### 5. Login to ECR
```bash
aws ecr get-login-password --region us-east-1 | \
    docker login --username AWS --password-stdin your-account-id.dkr.ecr.us-east-1.amazonaws.com
```

### 6. Push Docker Image
```bash
docker tag my-app:latest your-account-id.dkr.ecr.us-east-1.amazonaws.com/my-app:latest
docker push your-account-id.dkr.ecr.us-east-1.amazonaws.com/my-app:latest
```
