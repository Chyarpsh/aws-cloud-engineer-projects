# 🚀 Connect a Web Application to Amazon Aurora (AWS)


# 📌 Project Overview

In this project, I built and connected a PHP-based web application running on Amazon EC2 to a highly available Amazon Aurora database cluster. The goal was to simulate a real-world backend architecture where a web server securely communicates with a managed relational database.
This project demonstrates how production applications are connected to cloud-managed databases using secure credentials, network configuration, and service integration.


# 🏗 Architecture

User → EC2 Web Server (Apache + PHP) → Amazon Aurora Cluster
The EC2 instance hosts the application layer, while Aurora provides the managed relational database backend with built-in replication, backups, and high availability.


# 🛠 AWS Services Used

| Service	| Purpose |
| ------ | -------- |
| Amazon Aurora	| Fully managed, MySQL/PostgreSQL-compatible relational database with high availability |
| Amazon EC2	| Web server hosting the PHP application |
| Amazon VPC	 | Secure network for communication between EC2 and Aurora |
| Security Groups	| Controlled inbound and outbound access |
| EC2 Key Pairs	| Secure SSH access to the server |
| Amazon Linux 2023 | Operating system for the EC2 instance |


# 🔧 What I Built

I deployed an Aurora database cluster and configured an EC2 instance to run a PHP-based web application using Apache and PHP-MySQL libraries. The application connects to the database using a secure configuration file that stores the database endpoint, username, password, and database name 
I also verified database connectivity by running MySQL CLI queries and confirming that the application could read data from the database.


# ⚙️ Key Implementation Steps

1. Web Server Setup

On the EC2 instance, I installed and configured:

    Apache Web Server
    
    PHP
    
    PHP-MySQL (php-mysqli)
    
    MariaDB client libraries

This allowed the web application to run and communicate with Aurora 

2. Secure Database Configuration

I created a configuration file at:

    /var/www/inc/dbinfo.inc

This file stored:

    Aurora endpoint
    
    Database name
    
    Username
    
    Password

This allows the PHP application to securely connect to the Aurora cluster at runtime 

3. Database Connectivity Testing

To ensure everything worked correctly, I:

    Connected to the Aurora database using MySQL CLI
    
    Verified the database and tables existed
    
    Ran SELECT queries to confirm data access

This confirmed that the web app and database were properly integrated 



# 🧠 What I Learned

How Amazon Aurora provides high availability using a cluster-based architecture 

Connect a webapp with Aurora

How EC2 applications securely connect to managed databases

How to configure PHP applications using external configuration files

How to troubleshoot database connection errors

How to validate cloud infrastructure using SQL queries


# 💼 Why This Project Matters

This project reflects a real production cloud pattern:

    A web application hosted on EC2
    
    A highly available managed database
    
    Secure credential handling
    
    Network-based service communication

These are core responsibilities of Cloud Support Engineers and Cloud Engineers working with real customer systems.


# 🧹 Cost & Resource Cleanup

All AWS resources (EC2 instance, Aurora cluster, and related networking components) were deleted after testing to prevent unnecessary charges and to follow AWS cost-optimization best practices.
