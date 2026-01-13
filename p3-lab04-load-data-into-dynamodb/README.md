# 🚀 Load Data into Amazon DynamoDB using AWS CLI


# 📌 Project Overview

In this project, I created and populated an Amazon DynamoDB NoSQL database using the AWS CLI in CloudShell. The goal was to simulate how real cloud applications ingest and manage structured and semi-structured data in a scalable, serverless database.
This project demonstrates how cloud engineers work with DynamoDB tables, capacity planning, and command-line automation to manage production data pipelines.


# 🏗 Architecture

AWS CloudShell → AWS CLI → DynamoDB Tables
A browser-based Linux environment was used to interact with DynamoDB through CLI commands, allowing automated table creation and bulk data ingestion.


# 🛠 AWS Services Used

| Service |	Purpose |
| ------- | ------- |
| Amazon DynamoDB	| Fully managed NoSQL database for key-value and document data |
| AWS CloudShell	| Browser-based Linux shell with AWS CLI preinstalled |
| AWS CLI	 | Used to create tables and load data programmatically |


#🔧 What I Built

I created a DynamoDB table and loaded multiple datasets into it using batch write operations from the AWS CLI. The data included items with different attribute structures, demonstrating DynamoDB’s schema-flexible design 
I also explored how DynamoDB handles primary keys, partitions, and indexes for fast, scalable data access 



# ⚙️ Key Implementation Steps

1. Table Creation

I created a DynamoDB table using:

  A primary key to uniquely identify each item

  Attributes to store metadata such as author, content type, difficulty, services used, and more 

2. Capacity Planning

I manually configured:

  Read Capacity Units (RCUs)
    
  Write Capacity Units (WCUs)

I disabled auto-scaling to keep costs predictable and stay within the AWS Free Tier 

3. Bulk Data Loading

Using AWS CloudShell, I:

    Downloaded a ZIP file of sample datasets
    
    Extracted the files
    
    Used batch-write-item to insert JSON data into DynamoDB tables 

4. Data Validation

I verified that:

    Items were successfully written
    
    Attributes varied by item
    
    Data could be queried and viewed correctly 
    


# 🧠 What I Learned

How DynamoDB uses primary keys, partitions, and indexes for fast access

How RCUs and WCUs control performance and cost

How DynamoDB supports schema-less data models 

Load Data into DynamoDB

How to automate data ingestion using AWS CLI

How to troubleshoot data visibility errors


# 💼 Why This Project Matters

This project reflects real cloud engineering tasks:

    Ingesting application data
    
    Managing NoSQL databases
    
    Controlling performance and cost
    
    Using command-line tools for automation

These are essential skills for Cloud Support Engineers and Cloud Engineers working with serverless and data-driven applications.


# 🧹 Cost & Resource Cleanup

All DynamoDB tables and related resources were deleted after testing to avoid unnecessary AWS charges and to follow cost-optimization best practices.
