# Docker & Docker Compose installation script

Tested on Linux server - Ubuntu 22.04 LTS 64bit

This script installs Docker and Docker Compose, sets up automatic updates for Docker images and containers, and configures Docker to start on system boot on Linux

* Installs Docker and Docker Compose.
* Sets up a systemd timer and service to automatically update Docker images and containers daily at midnight.
* Configures Docker to start on system boot.

1. Save this script to a file named
   ```
   install_docker.sh
   ``` 
3. Make it executable
   ```
   chmod +x install_vscode_server.sh
   ```
5. Execute it with root privileges
   ```
   sudo ./install_docker.sh
   ```
* Optional:
  1. Copy/paste from here to your server machine and create/open file with following command:
  ```
  sudo nano path/to/your/install_docker.sh
  ```
  2. Use git to download specific file from github repo. On your machine navigate to `cd path/to/your/directory` and download desired file via weblink using commands `wget` or `curl`
  ```
  wget -O install_docker.sh https://raw.githubusercontent.com/JozeFons/Docker_installation_script/main/install_docker.sh
  ```
