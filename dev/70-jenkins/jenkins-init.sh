#!/bin/bash

set -e

echo "🚀 Installing required packages..."

dnf install -y \
    git \
    python3-pip \
    wget \
    curl \
    java-21-openjdk

echo "🚀 Installing Ansible..."
pip3 install ansible

echo "🚀 Installing Terraform..."

dnf config-manager --add-repo \
https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo

dnf install -y terraform

echo "🚀 Installing Packer..."

dnf install -y packer

echo "🚀 Installing Azure CLI..."

rpm --import https://packages.microsoft.com/keys/microsoft.asc

cat <<EOF > /etc/yum.repos.d/azure-cli.repo
[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

dnf install -y azure-cli

echo "🚀 Adding Jenkins repository..."

curl -o /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/rpm-stable/jenkins.repo

echo "🚀 Importing Jenkins GPG key..."

rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2023.key

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

echo "🚀 Jenkins setup completed!"