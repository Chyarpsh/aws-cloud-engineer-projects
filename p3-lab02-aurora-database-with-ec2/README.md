# 🚀 Connect a Web Application to Amazon Aurora (AWS)


# 📌 Project Overview

In this project, I deployed a highly available Amazon Aurora relational database and securely connected it to an EC2-based web application. The goal was to simulate a real-world backend architecture where application servers and database clusters communicate across a secured AWS network.

This project demonstrates how cloud engineers design, deploy, and connect production-grade infrastructure using AWS managed services while maintaining security, availability, and scalability.


# 🏗 Architecture Summary

User → EC2 Web Application → Amazon Aurora Cluster (Multi-AZ)

The EC2 instance acts as the application layer, while Aurora provides a fully managed, fault-tolerant relational database backend.


#🛠 AWS Services Used

| Service |	Purpose |
| ------- | ------- |
| Amazon Aurora |	Highly available MySQL/PostgreSQL-compatible relational database |
| Amazon EC2	| Web server hosting the application |
| Amazon VPC |	Network isolation and secure communication |
| Security Groups |	Controlled inbound and outbound access |
| EC2 Key Pairs |	Secure SSH access to the server |
| AWS Console	 | Resource provisioning and management |


# 🔍 What I Built

I created an Aurora cluster that automatically replicates data across multiple Availability Zones for high availability and fault tolerance. I then deployed an EC2 instance inside the same VPC and securely connected it to the Aurora database using network and security configurations.

This setup mimics how production cloud systems separate application and database layers while keeping them securely connected.


# ⚙️ Key Implementation Steps

    Created an Amazon Aurora cluster with automatic replication and failover 
    
    Configured VPC networking to allow EC2-to-Aurora communication 
    
    Generated and used an EC2 key pair to securely access the server via SSH
    
    Deployed an EC2 instance and recorded its Public IPv4 DNS for remote access
    
    Connected the application server to the Aurora database
    
    Verified connectivity and database availability


# 🧠 What I Learned

    How Amazon Aurora uses a cluster-based architecture for high availability
    
    How EC2 instances securely access backend databases
    
    Why key pairs and security groups are essential for server security
    
    How to design real-world cloud architectures separating compute and database layers
    
    How to troubleshoot cloud dependencies between services


# 💼 Why This Project Matters

This project reflects a real cloud engineering scenario where:

    Applications must be securely connected to databases
    
    High availability and automatic failover are required
    
    Infrastructure must be configured correctly to avoid downtime

These are core responsibilities of Cloud Support Engineers and Cloud Engineers in production environments.


# 🧹 Cost & Resource Cleanup

All AWS resources (EC2, Aurora, and networking components) were deleted after project completion to prevent unnecessary charges and to follow AWS cost-optimization best practices.
