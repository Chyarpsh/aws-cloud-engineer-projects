# Testing VPC Connectivity 🌐

# 📌 Project Overview

This project focuses on testing and validating network connectivity within a VPC by examining SSH access, security group configurations, inter-instance communication, and internet connectivity from an EC2 instance. I also explored how VPC Peering requires explicit route table updates on both VPCs for connectivity to work a critical lesson in cloud networking.

# 🎯 Key Skills Demonstrated

🔐 Configuring security groups to allow SSH access

🖥️ Using EC2 Instance Connect for secure, passwordless logins

🔄 Testing inter-instance traffic with ping (ICMP)

🛠️ Troubleshooting connectivity using VPC subnet rules + security groups

🌍 Testing outbound internet reachability using curl

🔗 Understanding VPC peering routing requirements

📡 Comparing ICMP vs HTTP/S level connectivity

# What I Tested & Implemented

1. SSH Connectivity to Public Server 🔑

Used EC2 Instance Connect, which generates temporary SSH keys and removes the need to manage keys locally

First SSH attempt failed because the security group allowed only HTTP, not SSH

Fixed by adding inbound SSH (port 22) from Anywhere-IPv4

