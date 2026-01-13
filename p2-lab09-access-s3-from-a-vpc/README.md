# 🚀 Accessing Amazon S3 Securely from a VPC

Private AWS Networking & Storage Security Project

Built a secure AWS architecture where an EC2 instance inside a private VPC accesses Amazon S3 through controlled AWS networking and identity-based security, demonstrating enterprise-grade cloud access patterns.

# 🧠 Why This Project Matters

In real companies, servers should never access cloud storage over the public internet. They must communicate privately inside AWS using identity-based security and network-controlled access.

This project simulates how cloud engineers:

    Secure application servers inside a VPC
    
    Control who can access S3
    
    Enforce least-privilege access
    
    Validate traffic using AWS CLI and IAM

This is the foundation of cloud security, compliance, and enterprise networking.


# 🏗 Architecture Implemented

Component	Configuration
VPC	Private AWS network for EC2
Compute	EC2 instance inside the VPC
Storage	Amazon S3 bucket
Identity	IAM access keys for EC2
Access Control	S3 bucket permissions
Connectivity	AWS internal networking

The EC2 instance was placed inside a VPC-isolated environment, and all S3 access was performed from within AWS instead of from a personal computer 

🔄 End-to-End Workflow
1️⃣ VPC & EC2 Setup

A dedicated VPC and EC2 instance were created to represent a secure application server environment 

2️⃣ Secure AWS CLI Authentication

The EC2 instance was configured with:

    Access Key
    
    Secret Key
    
    Default region

This allowed the EC2 server to authenticate securely with AWS services via the AWS CLI 

Best practice note: IAM roles are recommended in production because they provide automatically rotated credentials 

3️⃣ S3 Bucket Creation

An S3 bucket was created and files were uploaded from a local machine to simulate production data storage 

4️⃣ Verifying Private Access from VPC

From inside the EC2 instance, AWS CLI commands were run:

    aws s3 ls
    aws s3 ls s3://nextwork-vpc-project-arpita

This confirmed that the EC2 server inside the VPC could see the S3 bucket and its contents 

5️⃣ Uploading Files from EC2 to S3

A file was created inside the EC2 server and uploaded directly to S3:

    sudo touch /tmp/test.txt
    aws s3 cp /tmp/test.txt s3://nextwork-vpc-project-arpita
    aws s3 ls s3://nextwork-vpc-project-arpita

This validated:

    EC2 → S3 write access
    
    Network connectivity
    
    IAM authentication
    
    Bucket permissions


# 🔐 Security & Cloud Engineering Concepts Demonstrated

This project proves real-world AWS skills in:

    ✅ VPC-isolated compute
    ✅ Secure S3 access
    ✅ IAM access key configuration
    ✅ AWS CLI operations
    ✅ Cloud storage permissions
    ✅ Identity-based security
    ✅ Private cloud architecture

# 🛠 AWS Services Used

    Amazon VPC
    
    Amazon EC2
    
    Amazon S3
    
    AWS CLI
    
    AWS IAM

# ⏱ Project Duration

~2 hours of hands-on engineering
