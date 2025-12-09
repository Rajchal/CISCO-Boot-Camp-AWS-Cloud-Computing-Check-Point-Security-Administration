# AWS VPC Creation with Terraform

## Provider configuration
```hcl
provider "aws" {
    region = "us-east-1"
}
```

## VPC
```hcl
resource "aws_vpc" "main" {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support   = true

    tags = {
        Name = "training-vpc"
    }
}
```

## Internet Gateway
```hcl
resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "training-igw"
    }
}
```

## Public Subnet (Web Server)
```hcl
resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "public-subnet"
    }
}
```

## Private Subnet (App Server)
```hcl
resource "aws_subnet" "private" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b"

    tags = {
        Name = "private-subnet"
    }
}
```

## Route Table
```hcl
resource "aws_route_table" "main" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block      = "0.0.0.0/0"
        gateway_id      = aws_internet_gateway.main.id
    }

    tags = {
        Name = "main-rt"
    }
}
```

## Route Table Association
```hcl
resource "aws_route_table_association" "public" {
    subnet_id      = aws_subnet.public.id
    route_table_id = aws_route_table.main.id
}
```

## Security Group
```hcl
resource "aws_security_group" "allow_all" {
    vpc_id = aws_vpc.main.id

    ingress {
        from_port   = -1
        to_port     = -1
        protocol    = "icmp"
        cidr_blocks = ["10.0.0.0/16"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "training-sg"
    }
}
```

## Web Server Instance
```hcl
resource "aws_instance" "web_server" {
    ami                    = "ami-0c55b159cbfafe1f0"
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.allow_all.id]

    tags = {
        Name = "web-server"
    }
}
```

## App Server Instance
```hcl
resource "aws_instance" "app_server" {
    ami                    = "ami-0c55b159cbfafe1f0"
    instance_type          = "t2.micro"
    subnet_id              = aws_subnet.private.id
    vpc_security_group_ids = [aws_security_group.allow_all.id]

    tags = {
        Name = "app-server"
    }
}
```

## Outputs
```hcl
output "web_server_ip" {
    value = aws_instance.web_server.public_ip
}

output "app_server_ip" {
    value = aws_instance.app_server.private_ip
}
```