#!/bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
echo "The page was created by the user data by Moutaz Muhammad" > /var/www/html/index.nginx-debian.html