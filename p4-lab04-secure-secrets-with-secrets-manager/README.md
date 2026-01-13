# 🔐 Secure Application Secrets with AWS Secrets Manager


# 📌 Project Overview

In this project, I secured a Python-based web application that was originally exposing hard-coded AWS credentials in source code. I migrated the application to use AWS Secrets Manager and cleaned the GitHub repository history to remove leaked credentials.
This project demonstrates how cloud engineers protect sensitive secrets, enforce least-privilege access, and recover from real-world security mistakes such as accidentally committing credentials to GitHub.


# 🏗 Architecture

Web App (FastAPI + Boto3) → AWS Secrets Manager → AWS Services (S3, etc.)
The application retrieves AWS credentials securely at runtime instead of storing them in code.


# 🛠 AWS Services & Tools Used

| Service |	Purpose |
| ------- | ------- |
| AWS Secrets Manager |	Secure storage and retrieval of AWS credentials |
| AWS IAM	| Controls which identities can access secrets |
| Boto3 (Python SDK) |	Retrieves secrets programmatically |
| FastAPI + Uvicorn |	Hosts the web application |
| GitHub Secret Scanning & Push Protection |	Prevents leaking credentials |
| Git Rebase |	Removes sensitive data from commit history |


# 🔧 What I Built

I took a web application that was exposing AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY in config.py and migrated it to a secure secrets-based architecture. The application now fetches credentials from AWS Secrets Manager using Boto3 at runtime 
I also cleaned the Git repository so that no credentials remained in commit history.


# ⚙️ Key Implementation Steps

1. Detecting Insecure Credentials

The application initially used:

    Hard-coded AWS access keys in source code

These were flagged by GitHub Push Protection when I attempted to push the code 

2. Creating a Secure Secret

I stored AWS credentials in AWS Secrets Manager, allowing:

    Secure retrieval
    
    Optional automatic rotation
    
    Centralized secret management 

3. Updating Application Code

I modified config.py to:

    Call AWS Secrets Manager using Boto3
    
    Retrieve credentials dynamically
    
    Parse the JSON secret into AWS credential fields

This removed all hard-coded secrets from the codebase 

4. Cleaning Git History

Because credentials had already been committed once, I:

    Used Git rebase to remove the insecure commit
    
    Resolved merge conflicts manually
    
    Ensured only the secure version of the code remained
    
    Successfully pushed the cleaned repository to GitHub 


# 🧠 What I Learned

Why hard-coded secrets are a critical security risk

How AWS Secrets Manager protects credentials

How to use Boto3 to fetch secrets securely

How GitHub secret scanning prevents credential leaks

How to rewrite Git history to remove sensitive data permanently 


# 💼 Why This Project Matters

This project mirrors real cloud-security incidents:

Accidental credential leaks

Securing applications with secret managers

Cleaning compromised repositories

Enforcing least-privilege access

These are critical skills for Cloud Support Engineers, Cloud Engineers, and Cloud Security Engineers working in production environments.


# 🧹 Cost & Security Cleanup

All test secrets, IAM access keys, and development credentials were deleted after testing to prevent security risks and unwanted charges 
