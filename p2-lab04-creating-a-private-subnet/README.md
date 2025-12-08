# Creating a Private Subnet 🛡️


# 📌 Project Overview

This project focuses on designing a secure network environment within an Amazon VPC by creating a private subnet, configuring a dedicated route table, and implementing a custom Network ACL. The goal was to understand how AWS isolates sensitive workloads and enforces traffic control at both the subnet and VPC level.



# 🎯 Key Skills Demonstrated

🏗️ VPC network design (CIDR allocation, subnet planning)

🔒 Subnet isolation through private routing

🧱 Network ACL configuration for inbound/outbound traffic control

🌐 Public vs private subnet differentiation

🛣️ Custom route table creation and association

📝 Security best practices for workload protection



# 🔧 What I Implemented

Created a private subnet, ensuring it had no direct route to the internet

Designed and attached a dedicated private route table

Ensured routing was restricted to local VPC communication only

Created a private Network ACL with default deny rules

Applied the NACL to the private subnet to enforce subnet-level security

Compared private subnet architecture to public subnet design



# 📚 Technical Concepts Learned

1. Public vs Private Subnets 🌍

Public subnets include a route to an Internet Gateway (IGW)

Private subnets intentionally avoid IGW routing, preventing direct internet access

This protects databases and internal systems from exposure

Each subnet requires a unique CIDR block to avoid routing conflicts

2. Private Route Table 🛣️

The private subnet was associated with a newly created route table

The route table included only:
    
    Destination: VPC CIDR
    Target: local

This ensures all traffic remains internal to the VPC

No pathway exists for internet-bound traffic

3. Custom Network ACL (NACL) 🔐

A dedicated NACL named NextWork Private NACL was created

Default inbound and outbound rules were set to DENY, further isolating the subnet

NACLs act as a stateless security layer, adding an extra line of defense beyond security groups

This configuration blocks unsolicited inbound/outbound traffic completely



# 🤔 Unexpected Learning

I did not expect to create a private NACL specifically for this subnet. This helped reinforce how subnet-level governance differs from instance-level protections and why layered security is vital in production environments.


# ⏱️ Duration

This project took 1 hour to complete.
