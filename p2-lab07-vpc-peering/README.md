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

2. VPC Peering Connection 🔄
    
    Initiated a VPC Peering request from one VPC (Requester)
    
    Accepted the request from the second VPC (Accepter)
    
    Enabled private communication using AWS’s internal network
    
    No Internet Gateway, VPN, or hardware required

3. Route Table Configuration 🛣️

    Updated both VPC route tables to enable traffic flow:
    
    VPC-1 route → 10.2.0.0/16 via peering connection
    
    VPC-2 route → 10.1.0.0/16 via peering connection
    
    This step was critical — peering alone does not enable traffic

4. EC2 Access & Connectivity Testing 🖥️
    
    Used EC2 Instance Connect for SSH access
    
    Encountered an error due to missing public IPv4 address
    
    Resolved by associating an Elastic IP with the EC2 instance
    
    Verified connectivity using:
    
        ping <private-ip>

    Successful ping confirmed working VPC peering


5. Security Group Adjustments 🔐

    Updated security groups to allow:
    
        SSH (port 22)
        
        ICMP traffic between VPCs
        
        Learned that default security groups only allow traffic within the same VPC
        
        Explicit rules are required for cross-VPC communication

# 📚 Key Concepts Learned

🔸 What Is VPC Peering?

A direct, private connection between two VPCs

Traffic stays on AWS’s internal network

Low latency, high security, no internet exposure


🔸 Routing Is Mandatory

Peering ≠ automatic connectivity

Route tables must explicitly define paths to the peer VPC


🔸 Elastic IPs

Provide a static public IPv4 address

Required for consistent EC2 access via Instance Connect



# 🤔 One Thing I Didn’t Expect

I didn’t expect to create two independent VPCs and successfully enable communication between them. This project clearly demonstrated that VPC peering requires routing, security rules, and troubleshooting, not just connection approval.


# ⏱️ Time Spent

This project took 2 hours to complete.
