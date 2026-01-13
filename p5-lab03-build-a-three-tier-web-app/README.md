🌐 Build a Three-Tier Serverless Web Application on AWS
📌 Project Overview

In this project, I designed and deployed a complete three-tier serverless web application using Amazon S3, CloudFront, API Gateway, AWS Lambda, and Amazon DynamoDB. The goal was to understand how modern cloud applications connect frontend, backend, and database layers securely and efficiently without managing servers.

The application allows users to enter a userId on a CloudFront-hosted website, which retrieves user data from DynamoDB through API Gateway and Lambda.


# 🏗 Architecture

User → CloudFront → S3 (Frontend)
CloudFront → API Gateway → Lambda (Backend)
Lambda → DynamoDB (Data Layer)

Each layer is fully managed and scales automatically without server administration 


# 🛠 AWS Services Used

| Service	| Purpose |
| ------- | ------- |
| Amazon S3	| Hosts the static website frontend |
| Amazon CloudFront	| Globally distributes website content |
| Amazon API Gateway	| Exposes backend as a REST API |
| AWS Lambda	| Runs backend logic |
| Amazon DynamoDB	| Stores user data |
| AWS IAM	 | Controls access between services |


# 🔧 What I Built

Presentation Tier

I hosted the frontend in Amazon S3 and distributed it using CloudFront to provide low-latency global access. I verified this by accessing the site through the CloudFront distribution URL 

Logic Tier

I created a Lambda function connected to API Gateway that:

    Reads userId from the query string
    
    Fetches the matching record from DynamoDB
    
    Returns a JSON response with HTTP status codes (200 if found, 404 if not) 

Data Tier

I created a DynamoDB table named UserData using:

    userId as the partition key, allowing fast and scalable retrieval of user records 


# ⚙️ Connecting the Tiers

I updated script.js in the frontend to call the API Gateway invoke URL and display returned DynamoDB data on the CloudFront-hosted website.

I tested the API directly using:

  ?userId=1

and confirmed the JSON response contained userId, name, and email, proving the end-to-end data flow worked correctly 


# 🛠 Troubleshooting & Fixes

1. Invalid API URL

The frontend initially used a placeholder API URL, causing CloudFront to return a 403 AccessDenied XML page, which JavaScript failed to parse as JSON.
I fixed this by updating script.js with the correct API Gateway invoke URL and re-uploading it to S3 

2. CORS Errors

Because CloudFront and API Gateway are different domains, the browser blocked requests due to missing CORS headers.

I fixed this by:

  Enabling CORS for the /users GET and OPTIONS methods in API Gateway
  Redeploying the API stage

Updating Lambda to return:

  Access-Control-Allow-Origin: *

in every response

  Invalidating CloudFront so the updated files were served 


🧠 What I Learned

How three-tier cloud architectures work end-to-end

How CloudFront, API Gateway, Lambda, and DynamoDB integrate

How to debug CORS and API URL issues

How to expose Lambda as a secure REST API

How to design serverless, scalable systems 


# 💼 Why This Project Matters

This project mirrors how real production web applications are built:

    Frontend hosted globally
    
    Serverless backend
    
    Managed database
    
    Secure service-to-service communication

These are core skills for Cloud Support Engineers and Cloud Engineers.


# 🧹 Cost & Resource Cleanup

All S3 buckets, CloudFront distributions, API Gateway APIs, Lambda functions, and DynamoDB tables were deleted after testing to avoid unnecessary charges.
