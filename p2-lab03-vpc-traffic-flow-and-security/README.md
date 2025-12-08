# VPC Traffic Flow & Security Lab

# 📌 Overview

This lab demonstrates how network traffic flows inside an Amazon Virtual Private Cloud (VPC) and how AWS security layers—Route Tables, Security Groups, and Network ACLs—work together to protect cloud infrastructure.
It also includes a multi-region setup and shows how to track resources using AWS’s Global View tool.


# 🎯 Learning Objectives

By completing this lab, you will learn how to:

Configure public subnet routing using Route Tables and an Internet Gateway (IGW)

Apply instance-level security with Security Groups (stateful)

Apply subnet-level security with Network ACLs (stateless)

Understand Security Group vs Network ACL behavior and use cases

Deploy VPC resources in multiple AWS Regions

Track VPC and EC2 resources using EC2 Global View

Build a secure and observable VPC network foundation

# 🏗️ Key Concepts Covered

🔸 Route Tables

Control how packets are routed within a VPC

A route such as:

0.0.0.0/0 → Internet Gateway

makes a subnet public, enabling outbound and inbound internet traffic.

🔸 Security Groups (SGs)

Instance-level firewalls

Stateful: return traffic is automatically allowed

Only contain allow rules

This lab used:

Inbound: HTTPS from Anywhere (IPv4)

Outbound: Allow all (default)

🔸 Network ACLs (NACLs)

Subnet-level firewalls

Stateless: return traffic must be explicitly allowed

Support allow + deny rules

Custom NACLs start with deny all → ideal for least-privilege design

🔸 Multi-Region Resource Tracking

VPC and networking resources were deployed in a non-default region

EC2 Global View was used to observe:

VPCs

Subnets

Internet Gateways

Security Groups

Other EC2-related resources

Useful for distributed architectures, auditing, and troubleshooting

# 🛠️ What Was Done (Step-by-Step Summary)

Created a VPC and subnets

Attached an Internet Gateway and created a public route

Configured a Route Table to send 0.0.0.0/0 traffic to the IGW

Created a Security Group with HTTPS inbound access

(Optional) Created a custom Network ACL with explicit allow/deny rules

Launched resources in us-west-1 to simulate multi-region operations

Viewed all resources using EC2 Global View

Documented insights, screenshots, and security analysis in the PDF

# 📘 Key Takeaways

Public/private subnet behavior is defined at the routing layer

Security Groups protect individual instances

Network ACLs protect the entire subnet

SGs = stateful; NACLs = stateless

Multi-layer security is best practice (Defense in Depth)

Multi-region visibility is essential for real cloud operations

AWS Global View simplifies auditing and resource discovery across regions

# 📜 About This Lab

This lab is part of the AWS Cloud Engineer Projects series, designed to build practical, job-ready cloud skills across networking, security, compute, DevOps, and data engineering.
