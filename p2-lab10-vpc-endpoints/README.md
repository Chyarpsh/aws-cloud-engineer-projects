# 🔐 Secure S3 Access Using VPC Endpoints

Private AWS Networking & Zero-Trust Cloud Storage Architecture

Designed a private, zero-trust AWS architecture where an EC2 instance accesses Amazon S3 through a VPC Gateway Endpoint instead of the public internet, enforcing security using route tables, endpoint policies, and S3 bucket policies.


# 🧠 Why This Project Matters

In production cloud environments, data must never travel over the public internet — even inside AWS.

Enterprises use VPC Endpoints to:

    Eliminate internet exposure
    
    Enforce compliance (HIPAA, SOC2, PCI)
    
    Reduce attack surface
    
    Control exactly how cloud services are accessed

This project demonstrates real cloud security architecture, not just basic AWS usage.


# 🏗 Architecture Built

Component	Purpose
VPC	Private AWS network for EC2
EC2	Application server
S3	Secure object storage
VPC Gateway Endpoint	Private link to S3
Route Tables	Direct traffic to endpoint
Bucket Policy	Blocks public access
Endpoint Policy	Controls allowed S3 actions

The EC2 instance accesses S3 without touching the public internet.

🔄 End-to-End Security Flow
1️⃣ Baseline Access

The EC2 instance used AWS CLI with access keys to connect to S3 and verify normal access:

    aws s3 ls
    aws s3 ls s3://nextwork-vpc-project-arpita

This confirmed IAM credentials were valid and working 

2️⃣ VPC Gateway Endpoint Created

An S3 Gateway Endpoint was added to the VPC.

This provides a private AWS network path between:

    EC2 → VPC → S3 (no internet)

3️⃣ S3 Bucket Locked Down

A strict bucket policy was applied:

    ❌ Deny all requests
    ✅ Allow only requests coming from the VPC Endpoint

This instantly caused the AWS Console to show “Access Denied”, proving the bucket was no longer publicly reachable 

4️⃣ Route Tables Fixed

The subnet route table was updated to send S3 traffic to the VPC Endpoint instead of the internet.

Once fixed:

    aws s3 ls s3://nextwork-vpc-project-arpita

worked again — proving traffic was now flowing privately through the endpoint 

5️⃣ Zero-Trust Enforcement via Endpoint Policy

The endpoint policy was modified:

    "Effect": "Deny"

This instantly blocked all S3 access from the EC2 instance — even though IAM and bucket policy were correct — proving defense-in-depth security 


# 🔐 Security Concepts Proven

This project demonstrates real enterprise-grade cloud security:

    ✅ Private AWS service access
    ✅ Zero-trust networking
    ✅ Network-based access control
    ✅ IAM vs Resource vs Endpoint policies
    ✅ Data exfiltration prevention
    ✅ Compliance-ready S3 architecture

# 🛠 AWS Services Used

    Amazon VPC
    
    EC2
    
    S3
    
    VPC Gateway Endpoint
    
    Route Tables
    
    IAM
    
    S3 Bucket Policies
    
    Endpoint Policies
    
    AWS CLI

# ⏱ Project Duration

~2 hours of hands-on cloud security engineering
