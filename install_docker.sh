#!/bin/bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

# Ensure curl is installed
if ! command -v curl &> /dev/null; then
    echo "curl is not installed. Installing curl..."
    sudo apt-get update
    sudo apt-get install -y curl
fi

# Install Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Install Docker Compose
echo "Installing Docker Compose..."
sudo apt update
sudo apt install -y docker-compose

# Configure Docker automatic updates
echo "Configuring Docker automatic updates..."
sudo tee /etc/systemd/system/docker-updater.timer << EOF
[Unit]
Description=Docker Updater

[Timer]
OnCalendar=*-*-* 00:00:00
Persistent=true

[Install]
WantedBy=timers.target
EOF

sudo tee /etc/systemd/system/docker-updater.service << EOF
[Unit]
Description=Update Docker Images and Containers

[Service]
Type=oneshot
ExecStart=/usr/bin/docker image prune -af && /usr/bin/docker container prune -f && /usr/bin/docker-compose pull && /usr/bin/docker-compose up -d
EOF

# Enable and start the Docker updater timer
sudo systemctl daemon-reload
sudo systemctl enable docker-updater.timer
sudo systemctl start docker-updater.timer

# Start Docker service
echo "Starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Docker and Docker Compose installation and setup completed successfully!"
