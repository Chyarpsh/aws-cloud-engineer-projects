# Lab 04 – Build a Virtual Private Cloud (VPC) on AWS

This lab focuses on designing and deploying a custom Virtual Private Cloud (VPC) to understand AWS networking fundamentals.
You will see the creation of a VPC, subnets, route tables, and an Internet Gateway — forming the foundation of secure cloud networking.

This folder includes:

Build_VPC.pdf (full documentation)

Screenshots (VPC creation, subnets, IGW setup)

PNG images showing each step of the process

# ⭐ Objective

To manually build a secure and functional VPC environment, including:

Custom VPC

Public & private subnets

Internet Gateway

Routing configuration

Basic networking validation

# 🔧 AWS Services Used

| Service |	Purpose |
| Amazon VPC |	Create custom virtual network |
| Subnets	| Divide VPC into logical segments |
| Internet Gateway (IGW) |	Allow outbound internet access |
| Route Tables |	Control network traffic |
| AWS CloudShell |	CLI-based VPC validation (if used) |

# 🧩 What I Built
1️⃣ Created a Custom VPC

Defined:

IPv4 CIDR block (e.g., 10.0.0.0/16)

Name tag to identify the VPC

Screenshot included:
📌 Creating a VPC.png

2️⃣ Created a Subnet

Added at least one public or private subnet.

Defined:

Subnet CIDR (e.g., 10.0.1.0/24)

Availability Zone

Auto-assign public IP (if public subnet)

Screenshot included:

📌 Create a subnet.png

3️⃣ Created and Attached an Internet Gateway (IGW)

Steps:

Created IGW

Attached it to the VPC

Updated tags

Screenshot included:

📌 Internet Gateway.png

4️⃣ Updated Route Tables

Configured the main route table or a custom table:

For public subnet:

Destination: 0.0.0.0/0

Target: Internet Gateway

For private subnet:

No internet route (optional)

5️⃣ (Optional) CloudShell Testing

If AWS CloudShell was used, validated network components using commands like:

aws ec2 describe-vpcs
aws ec2 describe-subnets
aws ec2 describe-route-tables

Screenshot included:
📌 Cloudshell.png

# 🧠 Key Learnings

How VPCs form the foundation of AWS networking

Subnets logically separate resources for security & architecture

Internet Gateways allow outbound connectivity

Route tables define network behavior

Proper CIDR planning avoids IP conflicts
