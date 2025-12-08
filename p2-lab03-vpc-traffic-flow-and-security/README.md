# VPC Traffic Flow & Security Lab 🛡️

# Overview

This lab demonstrates how network traffic flows inside an AWS Virtual Private Cloud (VPC), and how to properly secure workloads using routing, security groups, and network ACLs. The lab also shows how to manage and view VPC resources across multiple AWS regions.

What This Project Covers

Creation and configuration of Route Tables, Internet Gateways, Subnets

Instance-level security using Security Groups (inbound/outbound rules)

Subnet-level security using Network ACLs (custom ACLs with allow/deny rules)

Comparison between security groups and network ACLs — instance-level vs subnet-level protection

Multi-region resource deployment and cross-region resource visibility

Use of AWS tooling (e.g. Global EC2 / VPC dashboard) for auditing resources

# Architecture & Concepts

Route Table: determines how network packets are routed — e.g. a route to 0.0.0.0/0 via an Internet Gateway makes a subnet public.

Internet Gateway (IGW): enables Internet connectivity to subnets flagged as public.

Security Group: acts as a stateful firewall at the instance level. We configured:

Inbound: HTTPS (port 443) from anywhere (IPv4)

Outbound: default allow-all

Network ACL (NACL): acts at the subnet level, stateless, allowing both allow- and deny- rules. Custom NACLs default to “deny all” until explicitly permitted — giving a second layer of subnet-level security beyond security groups.

Multi-region awareness: VPC resources (VPC, IGW, Security Group, etc.) created in a non-default region (e.g. us-west-1) to simulate a multi-region environment. Used a global EC2/VPC view to monitor resources across regions.

# Steps / What I Did

Created a new VPC and configured subnets.

Set up a Route Table — added a route for 0.0.0.0/0 targeting an Internet Gateway (IGW) to make the subnet public.

Created an Internet Gateway and attached to the VPC.

Launched EC2 instance(s) inside the subnet.

Created and assigned a Security Group to the instance: configured inbound and outbound rules (HTTPS inbound, outbound all).

Created a custom Network ACL for the subnet: initially “deny all”, then added explicit allow rules — demonstrating a default-deny subnet-level firewall.

Deployed resources in a separate AWS region (e.g. us-west-1) to test cross-region deployments.

Used AWS console’s global EC2/VPC dashboard to view and audit resources across all regions.

(All steps, configuration details, and reflections are in the included PDF: VPC_Traffic_Flow_and_Security.pdf.)

# What I Learned / Key Takeaways

Route tables + IGW define whether a subnet is public or private.

Security Groups provide fine-grained, instance-level protection — only allow what’s needed.

Network ACLs add a subnet-level security boundary — ideal as a “defense-in-depth” layer.

Custom NACLs default to deny all, which is a safer baseline than default “allow all.”

Deploying VPC infrastructure across regions helps simulate real-world, global-scale architecture.

Using global resource-view tools simplifies multi-region resource review and auditing.
