# 🧱 Create Amazon S3 Buckets with Terraform (Infrastructure as Code)


# 📌 Project Overview

In this project, I used Terraform to automate the creation and management of an Amazon S3 bucket using Infrastructure as Code (IaC). Instead of manually creating resources in the AWS Console, I defined the entire configuration declaratively in Terraform configuration files and provisioned infrastructure using Terraform’s workflow (init, plan, apply).

As part of the project, I also:

    Configured secure AWS credentials for local Terraform execution
    Enforced S3 security best practices by blocking public access
    Added resource tagging for governance and cost tracking
    Uploaded an S3 object using Terraform, managing both infrastructure and data through code

This project demonstrates how real DevOps, Cloud, and Platform Engineering teams manage AWS infrastructure reliably and repeatably using Terraform 


# 🏗 Architecture

Local Machine → Terraform → AWS Provider → Amazon S3
Terraform communicates with AWS using configured credentials to provision and manage S3 resources declaratively.


# 🛠 AWS Services & Tools Used

| Service/Tool	| Purpose |
| ------------- | ------- |
| Terraform	| Infrastructure as Code automation |
| Amazon S3	| Object storage service |
| AWS IAM	| Access control via credentials |
| AWS CLI	| Local AWS authentication |
| Terraform Registry	| Provider and resource documentation |


# 🔧 What I Built

I created a Terraform configuration (main.tf) that:

    Defines the AWS provider and region
    Provisions a globally unique S3 bucket
    Blocks all forms of public access by default
    Applies tags for ownership, environment, and project tracking
    Uploads a file to the S3 bucket using Terraform

This ensures the infrastructure is secure, repeatable, version-controlled, and easy to destroy when no longer needed.


# ⚙️ Key Implementation Steps

1. Terraform Provider Configuration

I defined the AWS provider and region (us-east-1) so Terraform knows which cloud platform to interact with and where resources should be created. Terraform uses this provider block to download the correct plugins and authenticate securely to AWS 

2. Creating the S3 Bucket Resource

I defined an aws_s3_bucket resource with a globally unique bucket name. Terraform ensures the bucket is created exactly as defined and tracks its state for future updates or deletion 

3. Enforcing S3 Security Best Practices

To keep the bucket private and secure, I added an aws_s3_bucket_public_access_block resource that:

    Blocks public ACLs
    Blocks public bucket policies
    Restricts public access entirely

This ensures the bucket follows AWS security best practices by default, without relying on manual configuration 

4. Customizing the Bucket with Tags

As a project extension, I added resource tags using Terraform:

    Project
    Owner
    Environment

Tagging is critical in real environments for:

    Cost tracking
    Resource ownership
    Governance and compliance

I verified the tags directly in the AWS Management Console after deployment 


5. Terraform Workflow (init → plan → apply)

| Command |	Purpose |
| ------- | ------- |
| terraform init	| Initializes the project and downloads provider plugins |
| terraform plan	| Previews changes before applying |
| terraform apply	| Creates or updates AWS resources |

Running these commands in order ensures Terraform safely prepares, validates, and applies infrastructure changes without surprises 

6. AWS Credentials & Troubleshooting

When I first ran terraform plan, I encountered a credentials error because Terraform could not find valid AWS credentials on my local machine.

I resolved this by:

    Installing the AWS CLI
    Creating AWS access keys
    Configuring local credentials so Terraform could authenticate securely

This reinforced how Terraform relies on AWS IAM authentication when running outside EC2 instances 

7. Uploading an S3 Object with Terraform

To manage both infrastructure and data, I added an aws_s3_object resource to upload a file into the S3 bucket.

After running terraform apply again, I verified:
    
    Successful Terraform execution
    The file appeared inside the S3 bucket

This demonstrates how Terraform can manage resources and content declaratively, not just infrastructure 


# 🧠 What I Learned

How Terraform implements Infrastructure as Code

How providers and resources work together

Why credential management is critical for IaC

How Terraform state tracks real AWS resources

How tagging supports governance and cost control

How to manage both infrastructure and data with Terraform 


# 💼 Why This Project Matters

This project demonstrates real-world IaC skills:

    Automation over manual AWS setup
    Secure-by-default infrastructure
    Repeatable and auditable deployments
    Foundations for scalable DevOps and Platform Engineering

These skills are essential for Cloud Engineers, DevOps Engineers, and Infrastructure Engineers.


# 🧹 Cost & Resource Cleanup

After completing the project, I used Terraform to destroy the resources, ensuring:

    No lingering AWS costs
    Clean infrastructure lifecycle management

Terraform makes cleanup just as easy and reliable as provisioning
