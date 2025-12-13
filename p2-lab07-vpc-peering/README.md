# VPC Peering 🔗

# 📌 Project Overview

In this project, I implemented VPC Peering to enable private communication between two isolated Amazon VPCs. I created two separate VPCs with non-overlapping CIDR ranges, established a peering connection, updated route tables on both sides, and validated connectivity using EC2 instances. This project highlights how AWS enables secure, low-latency, cross-VPC communication without using the public internet.

# 🎯 Key Skills Demonstrated

🌐 Designing multi-VPC architectures

🔗 Creating and managing VPC Peering connections

🛣️ Updating route tables for bidirectional traffic flow

🖥️ Launching EC2 instances across multiple VPCs

🔐 Configuring security groups for cross-VPC access

🧪 Testing connectivity using ping (ICMP) and SSH

🛠️ Troubleshooting networking and access issues

# 🔧 What I Implemented

1. Multi-VPC Architecture 🧱

    Created two separate VPCs:
    
    VPC-1: 10.1.0.0/16
    
    VPC-2: 10.2.0.0/16
    
    CIDR blocks were intentionally non-overlapping to avoid routing conflicts
    
    Created one public subnet in each VPC
    
    Launched one EC2 instance per VPC
