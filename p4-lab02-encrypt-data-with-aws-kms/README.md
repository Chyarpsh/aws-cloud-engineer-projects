# 🔐 Encrypt DynamoDB Data with AWS KMS


# 📌 Project Overview

In this project, I implemented encryption at rest for an Amazon DynamoDB table using a customer-managed AWS KMS key. I then tested how AWS enforces security by denying and granting access to encrypted data using IAM and KMS key policies.
This project demonstrates how cloud engineers protect sensitive data while ensuring only authorized users and applications can decrypt and use it.


# 🏗 Architecture

IAM Users → DynamoDB Table → AWS KMS Customer-Managed Key
DynamoDB stores encrypted data using a KMS key. AWS evaluates both IAM policies and KMS key policies before allowing any encryption or decryption operation.


# 🛠 AWS Services Used

| Service |	Purpose |
| ------- | ------- |
| Amazon DynamoDB	| NoSQL database storing encrypted data |
| AWS Key Management Service (KMS) |	Manages cryptographic keys used to encrypt and decrypt data |
| AWS IAM	| Controls which users are allowed to use the KMS key |


# 🔧 What I Built

I created a symmetric customer-managed KMS key and configured a DynamoDB table to use it for encryption at rest. I then created an IAM test user to verify that even with full DynamoDB permissions, access to encrypted data is blocked unless the user is also granted permission to use the KMS key 


# ⚙️ Key Implementation Steps

1. KMS Key Creation

I created a customer-managed symmetric key because it provides:

    Full control over key permissions
    
    Audit logs
    
    Key rotation
    
    Compliance-level security 

2. Encrypting DynamoDB

I configured a DynamoDB table to use:

    Customer-managed KMS key instead of AWS-managed or AWS-owned keys, allowing fine-grained security control 

3. Testing Unauthorized Access

I created a test IAM user with:

    Full DynamoDB permissions
    
    No KMS permissions

When the user attempted to read data, DynamoDB returned:

    “Access denied to kms:Decrypt”

This proved that DynamoDB cannot return data unless KMS allows decryption 

4. Granting Secure Access

I then updated the KMS key policy to allow the test user:

    kms:Decrypt
    
    kms:Encrypt
    
    kms:GenerateDataKey

After this, the user could successfully read and write encrypted data, proving that both IAM and KMS policies must allow access for data to be decrypted 


# 🧠 What I Learned

Encryption protects data at rest, not user permissions 

Encrypt Data with AWS KMS

AWS KMS evaluates IAM policies + KMS key policies together

DynamoDB uses transparent encryption, meaning authorized users see plaintext automatically

Customer-managed keys provide higher security and auditability

You must grant both DynamoDB access and KMS access to read encrypted data


# 💼 Why This Project Matters

This project reflects real enterprise security:

    Protecting sensitive customer data
    
    Enforcing least-privilege access
    
    Auditing encryption usage
    
    Preventing unauthorized data exposure

These are core responsibilities of Cloud Engineers and Cloud Security Engineers.


# 🧹 Cost & Resource Cleanup

All KMS keys, DynamoDB tables, and IAM users were removed after testing to avoid unnecessary charges and security risks
