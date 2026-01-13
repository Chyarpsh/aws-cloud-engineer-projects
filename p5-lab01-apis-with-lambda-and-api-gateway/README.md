# 🌐 Build a Serverless REST API with AWS Lambda & API Gateway


# 📌 Project Overview

In this project, I built a production-ready serverless REST API using AWS Lambda, Amazon API Gateway, and Amazon DynamoDB. The API allows clients to retrieve user data by sending HTTP requests to a public endpoint, which are processed by a Lambda function and returned as structured JSON responses.
The goal was to understand how modern cloud applications expose backend services without managing any servers.


# 🏗 Architecture

Client → API Gateway (REST API) → AWS Lambda → DynamoDB
API Gateway receives HTTP requests, Lambda executes backend logic, and DynamoDB stores the data.


# 🛠 AWS Services Used

| Service	| Purpose |
| ------- | ------- |
| AWS Lambda	| Runs backend code without servers |
| Amazon API Gateway	| Exposes Lambda as a public REST API |
| Amazon DynamoDB	| Stores user data |
| AWS IAM	| Controls permissions for Lambda and API Gateway |
| Amazon CloudWatch |	Logs and monitors API and Lambda activity |


# 🔧 What I Built

I created a Lambda function that accepts a userId parameter from incoming HTTP requests, queries a DynamoDB table for that user, and returns the data as a JSON response. If the user is not found, the function returns an appropriate HTTP status code 
I then exposed this Lambda function through a REST API in API Gateway using Lambda proxy integration, allowing requests and responses to be passed directly between API Gateway and Lambda.


# ⚙️ Key Implementation Steps

1. Lambda Backend

    The Lambda function:
    Receives a userId from the request

Queries DynamoDB for the matching record

Returns:

    200 OK with user data if found
    
    404 Not Found if the user does not exist
    
    Error responses if something fails 

2. API Gateway Integration

I created a REST API in API Gateway with:

    A /users resource
    
    A GET method

Lambda proxy integration, which forwards the entire HTTP request to Lambda and returns Lambda’s response automatically 

3. API Deployment

I deployed the API to a prod stage, making it publicly accessible through an Invoke URL. I verified endpoint behavior and learned that accessing /prod alone returns:

    Missing Authentication Token
    because a valid resource path (such as /prod/users) must be included in the request 

4. API Documentation

I generated and published API documentation in JSON format directly from API Gateway. The documentation includes:

    API name (UserRequestAPI)
    
    Base URL for the prod stage
    
    /users GET endpoint
    
    Expected request and response formats
    
    Lambda integration details

This ensures the API is easy for developers to understand and consume 


# 🧠 What I Learned

How Lambda functions act as serverless API backends

How API Gateway REST APIs expose Lambda over HTTP

How to pass query parameters to Lambda

How stages represent deployed API versions

How to generate and publish production-ready API documentation 


# 💼 Why This Project Matters

This project reflects how modern cloud applications are built:

    Serverless backends
    
    Scalable APIs
    
    No server management
    
    Clear API contracts

These are core skills for Cloud Support Engineers, Cloud Engineers, and Backend Cloud Developers.


# 🧹 Cost & Resource Cleanup

All Lambda functions, API Gateway resources, DynamoDB tables, and related IAM roles were deleted after testing to avoid unnecessary charges.
