## VPC – Traffic Flow & Security Lab

# 🧭 Project Summary

This lab explores how network traffic flows within a Virtual Private Cloud (VPC) in Amazon Web Services (AWS), and demonstrates how to build security boundaries using Route Tables, Security Groups, and Network ACLs. It also includes a multi-region deployment and shows how to track resources across regions using AWS console tools (e.g. “Global EC2/VPC” view). The goal: understand instance-level vs subnet-level security, routing, and secure cloud network architecture.

# 🔧 What You’ll Learn / What the Lab Does

Create and configure Route Tables and Internet Gateways (IGWs) to manage public/private subnet routing.

Define Security Groups to control instance-level inbound/outbound traffic.

Define Network ACLs (NACLs) for subnet-level packet filtering, with explicit allow/deny rules.

Compare and contrast Security Groups vs Network ACLs: stateful vs stateless, instance-level vs subnet-level, default behaviors, rule definitions.

Deploy VPC resources (VPC, subnets, IGW, Security Group, optional NACL) in a non-default AWS region — simulating a multi-region architecture.

Use AWS console (or relevant monitoring tools) to view and audit resources across all regions — demonstrating cross-region awareness for real-world cloud operations.

# 📄 Architecture & Concepts Overview

Route Table + IGW → Public Subnet: Using a route like 0.0.0.0/0 pointing to IGW turns a subnet into a public subnet.

Security Groups (SG): Instance-level firewalls, stateful — only allow rules, manage inbound and outbound separately. In this lab: inbound HTTPS from anywhere, outbound default-allow.

Network ACLs (NACLs): Subnet-level firewalls, stateless — can have allow and deny rules. A custom NACL defaults to “deny all”, encouraging least-privilege by default.

Defense in Depth: Combining SGs and NACLs adds layered security — stricter control at both instance and subnet layers.

Multi-Region Deployment & Global View: Deploy resources outside default region; use global resource visibility (e.g. AWS Global EC2/VPC dashboard) to track resources — useful in distributed or multi-region architectures.

# 🛠️ Lab Steps (What Was Done)

Create a new VPC with subnets.

Attach an Internet Gateway (IGW) to the VPC.

Create a Route Table and add a route (0.0.0.0/0 → IGW) to make the subnet public.

Launch one or more EC2 instances inside that public subnet (or plan for future workload).

Define a Security Group for the instance(s): allow inbound HTTPS (port 443) from anywhere (IPv4), allow default outbound.

(Optional / recommended) Create a custom Network ACL for the subnet: remove default allow-all rules, define explicit allow/deny as needed — implement least-privilege subnet firewall.

(Optional) Launch resources in a different AWS region than default — e.g. deploy VPC in “us-west-1” (or other) to simulate multi-region.

Use AWS console’s multi-region/global view (e.g. Global EC2/VPC) to locate and audit all VPC-related resources across regions.

Document all steps, configurations, screenshots, and reflect on security/routing implications (as captured in the PDF).

All configuration details, screenshots, routing tables, SG/NACL rules, and reflections live inside the provided VPC_Traffic_Flow_and_Security.pdf.

# ✅ Key Takeaways & Lessons Learned

Route tables + IGW determine public vs private subnets.

Security Groups provide fine-grained, stateful, instance-level security.

Network ACLs provide subnet-level, stateless, allow/deny security — good for extra layer of defense.

Default NACLs are permissive — custom NACLs should default to deny, then open only necessary traffic.

Using both SGs and NACLs enforces a layered security posture (defense-in-depth).

Multi-region resource tracking (via AWS global view tools) is important to manage distributed infrastructure and ensure visibility.

Proper documentation, screenshots, and configuration notes help replicate, audit, and cleanup resources (especially to avoid unexpected bills).

# 📂 Lab Files / Project Structure
/VPC_Traffic_Flow_and_Security/
│
├── VPC_Traffic_Flow_and_Security.pdf    # Full documentation: architecture, screenshots, configs, reflections  
├── README.md                             # This file  
└── screenshots/               # Folder for any screenshots referenced in the PDF/documentation  


# 📈 About This Project

This lab is part of a broader roadmap in the aws-cloud-engineer-projects repository, aimed at building end-to-end AWS cloud engineering skills — from networking and security to compute, storage, DevOps, and beyond.

It demonstrates a foundational understanding of cloud network architecture and security practices, which are essential for real-world cloud/DevOps roles.
