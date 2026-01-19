# 🚀 Deploy a Web Application with AWS CodeDeploy (CI/CD & Rollback)

# 📌 Project Overview

In this project, I built a production-style deployment pipeline to deploy a Java web application onto Amazon EC2 using AWS CodeDeploy. I provisioned the entire deployment environment using AWS CloudFormation, automated server configuration with deployment scripts, deployed application artifacts from Amazon S3, and implemented automatic rollback to recover safely from deployment failures.
This project demonstrates how real-world teams automate deployments, reduce manual errors, and ensure application reliability using CI/CD best practices and disaster recovery strategies 


# 🏗 Architecture

GitHub → CodeBuild → Amazon S3 (Artifact) → CodeDeploy → EC2 (Apache + Tomcat)
Infrastructure is provisioned with CloudFormation, application artifacts are built automatically, and deployments are executed reliably with rollback protection.


# 🛠 AWS Services & Tools Used

| Service/Tool |	Purpose |
| ------------ | -------- |
| AWS CloudFormation	| Infrastructure as Code (VPC, EC2, IAM, networking) |
| Amazon EC2	| Target server for application deployment |
| AWS CodeDeploy	| Automated application deployment |
| AWS CodeBuild	| Builds and packages application artifacts |
| Amazon S3	| Stores deployment artifacts |
| AWS CodeArtifact	| Secure dependency management |
| AWS IAM	| Permissions and role-based access |
| Amazon CloudWatch	| Logs and deployment monitoring |
| Apache HTTPD	| Reverse proxy (port 80) |
| Apache Tomcat	| Java application server (port 8080) |
| Shell Scripts	| Automate install, start, stop actions |


# 🔧 What I Built

I created a fully automated deployment environment that:

    Provisions EC2, VPC, IAM, and networking using CloudFormation
    Builds a deployable .war file using CodeBuild
    Packages deployment scripts and configuration into an artifact
    Deploys the application using CodeDeploy lifecycle hooks
    Uses Apache as a reverse proxy for clean public access
    Automatically rolls back on deployment failure

This setup mirrors how applications are deployed and protected in real production environments.


# ⚙️ Key Implementation Steps

1. Infrastructure Provisioning with CloudFormation

Instead of manually creating resources, I used AWS CloudFormation to provision:

    VPC and public subnet
    Internet gateway and routing
    Security groups
    IAM roles and instance profile
    EC2 instance

Using Infrastructure as Code ensures the environment is repeatable, version-controlled, and easy to delete by simply removing the stack 

2. Deployment Scripts Automation

I created reusable shell scripts to automate server configuration and deployment:

    Script	Purpose
    install_dependencies.sh	Installs Tomcat & Apache, configures reverse proxy
    start_server.sh	Starts and enables Apache & Tomcat
    stop_server.sh	Safely stops services before deployment

These scripts ensure consistent server setup, even on a brand-new EC2 instance 

3. Defining Deployment Logic with appspec.yml

I wrote an appspec.yml file to control how CodeDeploy deploys the application:

    Specifies where the .war file is copied
    Defines lifecycle hooks for stopping services, installing dependencies, and starting the server

This file ensures deployments are clean, automated, and repeatable 

4. Updating the CI Build Artifact

I updated buildspec.yml so that CodeBuild packages:

    The compiled .war file
    appspec.yml
    All deployment scripts

This produces a complete deployable bundle that CodeDeploy can use directly without manual steps 

5. Configuring CodeDeploy

I created:

    A CodeDeploy application (EC2/On-Prem compute platform)
    A deployment group targeting EC2 via resource tags
    An IAM service role allowing CodeDeploy to interact with EC2 and S3

I used the CodeDeployDefault.AllAtOnce deployment configuration, which deploys updates to all instances simultaneously—ideal for a single-instance setup 

6. Successful Deployment Verification

I specified an Amazon S3 revision location containing the deployment artifact.

After deployment completed successfully, I accessed the EC2 public URL and confirmed:

    The web application loaded correctly
    The latest GitHub changes were live

This verified the entire CI/CD deployment worked end to end 


# 🔄 Disaster Recovery & Rollback (Project Extension)

To test reliability, I intentionally introduced an error by misspelling systemctl as systemctll in the stop_server.sh script and forcing the script to exit with a non-zero status.

Because automatic rollback was enabled:
    
    CodeDeploy detected the failure
    Stopped the failed deployment
    Restored the EC2 instance to the last successful version

This demonstrated how rollback mechanisms protect production systems from broken deployments. In real environments, I would combine this with rolling or blue/green deployments, health checks, and CloudWatch alarms for even safer releases 


# 🧠 What I Learned

How to deploy applications using AWS CodeDeploy

How deployment lifecycle hooks work

How Infrastructure as Code simplifies environment management

How to automate server setup with scripts

How rollback protects production systems

How CI/CD pipelines work end to end in AWS 


# 💼 Why This Project Matters

This project showcases real DevOps and Cloud Engineering skills:

    Automated deployments
    Infrastructure as Code
    Secure IAM permissions
    Failure handling and rollback
    Production-style CI/CD pipelines

These skills are highly valuable for Cloud Engineer, DevOps Engineer, and Cloud Support Engineer roles.


# 🧹 Cost & Resource Cleanup

After completing the project, I deleted the CloudFormation stack, which automatically removed:

    EC2 instance
    Networking resources
    IAM roles
    Deployment infrastructure

This ensured no unnecessary AWS costs remained
