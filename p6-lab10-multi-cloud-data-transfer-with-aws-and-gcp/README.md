# 🌍 Multi-Cloud Data Transfer with AWS and Google Cloud Platform (GCP)


# 📌 Project Overview

In this project, I built a secure, production-style multi-cloud data backup solution by transferring data from Amazon S3 (AWS) to Google Cloud Storage (GCS) using Google Cloud Storage Transfer Service. The solution uses identity federation to securely connect AWS and GCP without sharing long-term access keys, following industry best practices for cross-cloud authentication and least-privilege access. As an extension, I implemented selective data transfer using a manifest file, allowing precise control over which files are backed up—improving security, cost efficiency, and operational control. This project mirrors how real organizations design resilient, vendor-agnostic backup and disaster-recovery systems 


# 🏗 Architecture

Amazon S3 (Source) → GCP Storage Transfer Service → Google Cloud Storage (Destination)
Secure cross-cloud access is enabled using AWS IAM + GCP identity federation, with no static credentials exchanged.


# 🛠 AWS & GCP Services Used

| Cloud	| Service |	Purpose |
| ----- | ------- | ------- |
| AWS	| Amazon S3	| Source object storage |
| AWS	| AWS IAM |	Role-based access control |
| AWS |	STS | Temporary credentials via federation |
| GCP |	Google Cloud Storage	| Backup destination |
| GCP	| Storage | Transfer Service	Managed cross-cloud data transfer |
| GCP	| IAM	| Identity & access control |
| GCP	| Cloud Shell	| GCP configuration and testing |


$ 🔧 What I Built

I implemented a secure multi-cloud backup pipeline that:

    Stores source data in Amazon S3
    Transfers data to Google Cloud Storage
    Uses identity federation instead of access keys
    Applies least-privilege IAM policies
    Supports batch transfers
    Supports selective transfers using a manifest file

This design improves reliability, disaster recovery, flexibility, and vendor independence.


# ⚙️ Key Implementation Steps

1. Preparing Source Data in Amazon S3

I created an Amazon S3 bucket and uploaded multiple PDF files to act as the source data. These files represent real-world documents that would typically need to be backed up across cloud providers for redundancy and disaster recovery 

2. Setting Up Google Cloud Platform

I created a Google Cloud account and configured:

    A Google Cloud Storage bucket as the destination
    The appropriate region to balance latency and availability
    A storage class optimized for frequently accessed backup data

This bucket acts as the secondary backup location outside AWS 

3. Understanding Storage Transfer Service

I used Google Cloud Storage Transfer Service, a managed service designed to move data between storage systems at scale.

I learned the difference between:

    Batch transfers – run once or on a schedule
    Event-driven transfers – trigger automatically when new data is added

For this project, I implemented a batch transfer, which is commonly used for periodic backups 

4. Secure Cross-Cloud Access with Identity Federation

Instead of using AWS access keys, I configured identity federation so that:

  Google’s Storage Transfer Service can assume an AWS IAM role
  WS issues temporary credentials via STS
  Access automatically expires and is fully auditable

I created a custom IAM role in AWS with a trust policy that explicitly allows only the Google Storage Transfer Service identity to assume the role.

The trust policy restricts access using a subject ID, ensuring that only my specific GCP project’s service account can read from the S3 bucket—providing tight security and least-privilege access 

5. Executing the Data Transfer

After configuring permissions and the transfer job, I ran the transfer and verified success by:

    Opening the destination GCS bucket
    Confirming all files appeared with correct names, sizes, and timestamps

This confirmed the data was securely copied from AWS to GCP without errors 

6. Selective Transfer Using a Manifest File (Project Extension)

As an extension, I configured a manifest file to control exactly which files should be transferred.

The manifest lists specific object names or paths, allowing the Storage Transfer Service to:

    Copy only selected files
    Ignore unnecessary or sensitive data
    Reduce transfer cost and storage usage

This approach is commonly used in enterprise environments where not all data should be replicated across clouds 


# 🧠 What I Learned

How multi-cloud architectures improve resilience

How identity federation enables secure, keyless authentication

Why custom IAM trust policies are critical for cross-cloud security

Differences between batch vs event-driven transfers

How storage regions and classes affect cost and performance

How manifest files enable precise, production-grade data control 


# 💼 Why This Project Matters

This project demonstrates advanced, real-world cloud engineering skills:

    Multi-cloud architecture design
    Secure cross-cloud authentication
    Least-privilege IAM policies
    Disaster recovery and backup strategy
    Vendor lock-in reduction

These skills are highly valuable for Cloud Engineers, Cloud Security Engineers, and DevOps Engineers, especially in enterprise environments.


# 🧹 Cost & Resource Cleanup

After verification, I deleted:

    The AWS IAM role and policies
    The Google Cloud Storage Transfer job
    Source and destination storage resources

This ensured no unnecessary cloud costs remained 
