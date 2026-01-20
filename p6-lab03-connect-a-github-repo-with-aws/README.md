# 🔗 Connect a GitHub Repository with AWS (Git, EC2 & DevOps Foundations)


# 📌 Project Overview

In this project, I connected a cloud-hosted web application running on Amazon EC2 to a GitHub repository using Git. I initialized a local Git repository on the EC2 instance, linked it to GitHub, and pushed application code securely using GitHub Personal Access Tokens (PATs). This project demonstrates real-world DevOps fundamentals, including source control, remote development, secure authentication, and preparing an application for a future CI/CD pipeline.


# 🏗 Architecture

Local Machine / VS Code → SSH → Amazon EC2 → Git → GitHub Repository
Code is developed on an EC2 instance and version-controlled in GitHub, enabling collaboration, history tracking, and CI/CD automation.


# 🛠 AWS Services & Tools Used

| Service/Tool	| Purpose |
| ------------- | ------- |
| Amazon EC2	| Hosts the cloud-based web application |
| Git	| Distributed version control system |
| GitHub	| Remote repository for source code |
| VS Code | Remote development environment |
| SSH | Secure access to EC2 |
| Apache Maven	| Builds the Java web application |
| GitHub Personal Access Token	| Secure authentication for Git operations |


# 🔧 What I Built

I connected an existing Java web application running on EC2 to GitHub by:

    Installing and configuring Git on the EC2 instance
    Initializing a local Git repository in the project directory   
    Creating and linking a remote GitHub repository   
    Pushing application code securely using a Personal Access Token   
    Verifying changes through commit history and GitHub UI

This setup mirrors how engineers manage code in production DevOps workflows.


# ⚙️ Key Implementation Steps

1. Installing Git on EC2

I installed Git on the EC2 instance using:

    sudo dnf update -y
    sudo dnf install git -y

This enabled version control directly on the cloud server where the application was hosted 

2. Initializing a Local Git Repository

Inside the web application directory, I ran:

    git init

This created a local Git repository and established the default branch, allowing Git to track changes to project files 

3. Linking the Repository to GitHub

I created a new GitHub repository and connected it to my local repo using:

    git remote add origin https://github.com/Chyarpsh/nextwork-web-project.git

This linked my EC2-based project to GitHub so changes could be pushed remotely 

4. Staging, Committing, and Pushing Code

I staged and committed my application files:

    git add .
    git commit -m "Initial commit of cloud web application"
    git push -u origin main

This uploaded the project code to GitHub and synchronized the local and remote repositories 

5. Secure Authentication with GitHub Tokens

GitHub no longer supports password-based authentication for Git operations.

To resolve authentication errors, I:

    Generated a GitHub Personal Access Token (PAT)

Used the token instead of a password when pushing code

This ensured secure, modern authentication for GitHub access from EC2 

6. Making and Tracking Code Changes

To verify Git was working correctly, I:

    Edited index.jsp on the EC2 instance
    Committed the changes locally
    Pushed the update to GitHub

The updated file appeared immediately in the GitHub repository, confirming end-to-end Git integration 


# 🧠 What I Learned

How Git tracks and manages version history

How to securely connect EC2-hosted code to GitHub

Why Personal Access Tokens are required for authentication

How staging, committing, and pushing work together

How GitHub enables collaboration and CI/CD automation

Why source control is foundational to DevOps pipelines 


# 💼 Why This Project Matters

This project reflects real-world DevOps and cloud workflows:

Version-controlling cloud applications

Secure authentication and access control

Preparing applications for automated CI/CD pipelines

Collaboration-ready, production-grade repositories

These skills are essential for Cloud Engineers, DevOps Engineers, and Cloud Support Engineers.


# 🧹 Cost & Resource Cleanup

After testing, the EC2 instance and related AWS resources were terminated to avoid unnecessary charges and maintain a clean AWS environment 
