#!/bin/bash

set -e

echo "🚀 Updating system packages..."
dnf update -y

echo "🚀 Installing required packages..."

dnf install -y \
    git \
    python3-pip \
    wget \
    curl

echo "🚀 Installing Ansible..."

pip3 install ansible

echo "🚀 Installing Java 21..."
dnf install -y java-21-openjdk

echo "🚀 Adding Jenkins repository..."
curl -o /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/rpm-stable/jenkins.repo

echo "🚀 Importing Jenkins GPG key..."
rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2026.key

echo "🚀 Installing Jenkins..."
dnf install -y jenkins

echo "🚀 Enabling and starting Jenkins..."
systemctl enable jenkins
systemctl start jenkins

echo "🚀 Opening Jenkins port in firewall..."

firewall-cmd --permanent --add-port=8080/tcp

firewall-cmd --reload

echo "🚀 Creating Jenkins SSH directory..."
mkdir -p /var/lib/jenkins/.ssh

echo "🚀 Adding private SSH key..."
cat <<EOF > /var/lib/jenkins/.ssh/roboshop-azure
${private_key}
EOF

echo "🚀 Setting SSH permissions..."
chmod 700 /var/lib/jenkins/.ssh
chmod 600 /var/lib/jenkins/.ssh/roboshop-azure

echo "🚀 Setting Jenkins ownership..."
chown -R jenkins:jenkins /var/lib/jenkins/.ssh
