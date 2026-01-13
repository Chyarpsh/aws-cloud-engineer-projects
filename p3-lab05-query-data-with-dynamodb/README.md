# 🔍 Query & Transact Data with Amazon DynamoDB (AWS)


# 📌 Project Overview

In this project, I created and queried Amazon DynamoDB tables using both the AWS Console and the AWS CLI. I also implemented DynamoDB transactions to ensure atomic updates across multiple tables. The goal was to simulate how modern serverless applications store, retrieve, and update data at scale.
This project demonstrates how cloud engineers design efficient data models, run targeted queries, and maintain consistency in distributed NoSQL systems.


# 🏗 Architecture

AWS CloudShell → AWS CLI → DynamoDB Tables
The AWS CLI was used to query, retrieve, and update DynamoDB data from a browser-based Linux environment.

# 🛠 AWS Services Used

| Service |	Purpose |
| ------- | ------- |
| Amazon DynamoDB	| Fully managed NoSQL database for scalable applications |
| AWS CloudShell |	Browser-based Linux shell with AWS CLI preinstalled |
| AWS CLI	 | Used to create tables, run queries, and execute transactions |


# 🔧 What I Built

I created DynamoDB tables with composite primary keys (partition key + sort key) and populated them with data. I then ran queries using both the AWS Console and AWS CLI to retrieve specific records, track consumed capacity, and control the returned attributes 
I also implemented DynamoDB transactions to update multiple tables atomically in a single operation.


# ⚙️ Key Implementation Steps

1. Data Modeling

I designed DynamoDB tables using:

    Partition keys to group related data
    
    Sort keys to order items within a group

This allows fast, scalable queries for application data such as comments on a post 

2. Querying Data

Using AWS CloudShell, I ran:

    get-item queries to retrieve specific records
    
    ProjectionExpression to return only selected attributes
    
    ConsistentRead and ReturnConsumedCapacity to control accuracy and measure read cost 

This allowed me to retrieve only the data I needed while monitoring how much capacity was consumed.

3. Transactions

I executed a DynamoDB transaction using:

    aws dynamodb transact-write-items

This transaction:

    Added a new comment to the Comment table
    
    Incremented the comment count in the Forum table

Both operations were executed atomically, ensuring data consistency across tables 


# 🧠 What I Learned

How DynamoDB uses partition and sort keys for efficient queries 

Query Data with DnamoDB

Why every Query must include the partition key

How DynamoDB differs from relational databases (no joins, no cross-partition sorting) 

Query Data with DnamoDB

How to control read cost and performance using query options

How to ensure data consistency with DynamoDB transactions


# 💼 Why This Project Matters

This project reflects real cloud engineering work:

    Querying production databases
    
    Controlling cost and performance
    
    Designing scalable NoSQL data models
    
    Performing atomic updates across multiple tables

These are core skills for Cloud Support Engineers and Cloud Engineers working with serverless backends.

🧹 Cost & Resource Cleanup

All DynamoDB tables and resources were manually deleted after testing to avoid unnecessary AWS charges and to follow cost-optimization best practices 
