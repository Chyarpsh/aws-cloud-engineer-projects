# ⚡ Fetch User Data with AWS Lambda & DynamoDB


# 📌 Project Overview

In this project, I built a secure serverless data-retrieval workflow using AWS Lambda, Amazon DynamoDB, IAM, and CloudWatch. The Lambda function retrieves user records from a DynamoDB table based on a provided userId, while enforcing least-privilege access through tightly scoped IAM policies.
The goal was to understand how production-grade serverless applications securely access databases and how to debug permission issues in real AWS environments.


# 🏗 Architecture

Client / Test Event → AWS Lambda → DynamoDB (UserData Table)
CloudWatch Logs capture execution and error details.


# 🛠 AWS Services Used

| Service	| Purpose |
| ------- | ------- |
| AWS Lambda	| Executes serverless backend logic |
| Amazon DynamoDB	| Stores user records |
| AWS IAM |	Controls Lambda’s access to DynamoDB |
| Amazon CloudWatch |	Logs Lambda execution and errors |
| AWS SDK (Boto3)	| Used by Lambda to query DynamoDB |


# 🔧 What I Built

I created a DynamoDB table named UserData with a partition key userId, and added sample user records including name and email 

I then built a Lambda function that:

  Accepts a userId from the incoming event

  Calls DynamoDB’s GetItem API via the AWS SDK

  Returns the user’s data if found

  Logs errors and handles missing or invalid input gracefully 
  

# ⚙️ Key Implementation Steps

1. Data Layer

The DynamoDB table uses:

    userId (string) as the partition key, allowing fast retrieval of user-specific records
    A schemaless design, so items can have different attributes while still sharing the same key structure 

2. Lambda Function & Execution Role

The Lambda function runs with an execution role that initially had only basic CloudWatch logging permissions. When tested, the function executed successfully but returned:

    AccessDeniedException

because it lacked permission to call dynamodb:GetItem on the UserData table 

3. Debugging IAM Permissions

I analyzed the error message and selected AmazonDynamoDBReadOnlyAccess to grant:

    GetItem
    
    Query
    
    Scan
    
    DescribeTable

This fixed the error without granting unnecessary write or admin privileges, preserving the principle of least privilege 

4. Final Validation

After attaching the policy, I re-ran the Lambda test event.

The function executed successfully with no AccessDenied errors, proving that:

IAM permissions were correctly configured

The function logic was working as intended 

I then went further by replacing the managed policy with a custom inline IAM policy that allows only:

  dynamodb:GetItem

on the specific UserData table ARN, making the system even more secure and production-ready 


# 🧠 What I Learned

How Lambda execution roles control access to AWS services

How to debug AccessDeniedException errors

Why least-privilege IAM policies are critical in serverless apps

How DynamoDB retrieves data using a partition key

How CloudWatch logs help validate and troubleshoot serverless workflows 


# 💼 Why This Project Matters

This project reflects real-world cloud engineering work:

    Securing backend APIs
    
    Granting only the exact permissions required
    
    Debugging IAM and service integration issues
    
    Building scalable, serverless data access layers

These are core responsibilities of Cloud Support Engineers and Cloud Engineers.


# 🧹 Cost & Resource Cleanup

All DynamoDB tables, Lambda functions, and IAM roles were deleted after testing to avoid unnecessary charges and to keep the AWS account secure.
