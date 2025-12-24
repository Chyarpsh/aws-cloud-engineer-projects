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

VPC Flow Logs enabled at the subnet level

Logs delivered to Amazon CloudWatch

Traffic analyzed using CloudWatch Logs Insights
