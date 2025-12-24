# VPC Monitoring with Flow Logs 📊

# Project Overview

In this project, I implemented VPC Flow Logs to monitor, analyze, and troubleshoot network traffic across multiple Amazon VPCs. I configured logging at the subnet level, routed logs to Amazon CloudWatch, and used CloudWatch Logs Insights to analyze traffic patterns, identify connectivity issues, and validate VPC peering behavior.

This project demonstrates real-world cloud monitoring, security visibility, and network troubleshooting skills used in production AWS environments.

# Problem Statement

Modern cloud environments require visibility into network traffic for:

Security monitoring

Connectivity troubleshooting

Auditing and compliance

Performance analysis

By default, VPC traffic is not logged. This project solves that gap by enabling and analyzing VPC Flow Logs to understand who communicated with whom, how, when, and whether traffic was allowed or denied.

# Architecture Summary 🏗️

Two VPCs with non-overlapping CIDR ranges

VPC-1: 10.1.0.0/16

VPC-2: 10.2.0.0/16

One public subnet per VPC

One EC2 instance per VPC

VPC Peering connection between VPC-1 and VPC-2

# Key Skills Demonstrated

🌐 Multi-VPC network design

🔍 Network traffic monitoring using VPC Flow Logs

📜 Log ingestion and retention with CloudWatch Logs

🔐 IAM policy and role creation for AWS logging services

🧪 Connectivity troubleshooting using ICMP (ping)

📊 Log analysis and visualization using CloudWatch Logs Insights

🔗 VPC peering validation through traffic analysis

# What I Implemented

1. VPC & EC2 Setup

  Created two isolated VPCs with unique CIDR blocks
  
  Launched EC2 instances in each VPC for connectivity testing
  
  Configured security groups to allow ICMP traffic for testing

2. VPC Flow Logs Configuration 🔎

  Enabled VPC Flow Logs at the subnet level
  
  Configured logs to capture all inbound and outbound traffic
  
  Sent logs to CloudWatch Log Groups for centralized monitoring

3. IAM Permissions for Logging 🔐

  Created a custom IAM policy allowing VPC Flow Logs to publish logs
  
  Created an IAM role and attached the policy
  
  Used a trust policy to allow the VPC Flow Logs service to assume the role

4. Connectivity Testing & Troubleshooting 🛠️

  Performed ICMP ping tests between EC2 instances
  
  Identified failed connectivity due to missing routes
  
  Established VPC peering
  
  Updated route tables in both VPCs
  
  Retested connectivity and confirmed successful communication

5. Flow Log Analysis with CloudWatch Logs Insights 📈

  Analyzed flow logs to determine:
  
    Source & destination IPs
    
    Ports and protocols
    
    Accepted vs rejected traffic
  
    Bytes transferred
  
  Ran queries such as:
  
    Top 10 byte transfers by source and destination
    
  Visualized traffic patterns using charts

  
