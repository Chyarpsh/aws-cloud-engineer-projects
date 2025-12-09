# Launching VPC Resources 🚀

# 📌 Project Overview

In this project, I launched and configured essential VPC resources to build a secure, scalable, and production-ready cloud network. I created public and private subnets, configured routing, and set up security groups to support both public-facing and internal workloads. Additionally, I learned how AWS can auto-provision foundational VPC components using the VPC Wizard, speeding up the entire network creation process.

# 🎯 Key Skills Demonstrated

🏗️ Designing public and private subnets

🌐 Using Internet Gateways for outbound internet access

🔐 Creating and applying Security Groups for EC2 instances

🔄 Understanding how AWS automatically provisions VPC components

🖥️ Configuring direct VM access (SSH)

⚙️ Launching EC2 instances in both public and private subnets

🗺️ Interpreting the VPC Resource Map

☁️ Understanding multi-AZ high-availability concepts

# 🔧 What I Implemented

1. Building a Multi-Tier VPC Architecture 🧱

I created public and private subnets, attached an Internet Gateway, and configured routing and security rules to support different types of workloads.

This architecture allows:

Public servers ⇒ internet-accessible

Private servers ⇒ internal-only, secure

2. Direct VM Access Setup (SSH) 🔑

Configured SSH access using a .pem private key

Understood direct access vs bastion host or load balancer access

Reviewed how key pairs secure EC2 login authentication

3. Launching a Public Server 🌍

Selected NextWork VPC

Deployed the instance in the public subnet

Assigned an existing security group to allow public access (e.g., SSH/HTTPS)

4. Launching a Private Server 🔒

Created a dedicated security group with stricter controls

Allowed inbound traffic only from the public server’s security group

Ensured the private instance had no direct internet exposure

Demonstrated proper internal-tier workload isolation

5. Speeding Up VPC Creation ⚡

I used the VPC Wizard ("VPC and more"), which automatically created:

A VPC (10.0.0.0/16)

Public + private subnets across two Availability Zones

Route tables

Optional NAT gateways

Internet gateway

This follows AWS best practices for:

High availability

Redundancy

Production readiness
