# amazon linux


ssh -i "your-key.pem" ec2-user@your-instance-ip << 'EOF'
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Server Running</h1>" | sudo tee /var/www/html/index.html
EOF