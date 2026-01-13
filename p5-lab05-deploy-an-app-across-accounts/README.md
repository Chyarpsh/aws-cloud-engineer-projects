# 🔁 Deploy a Containerized App Across AWS Accounts using Amazon ECR


# 📌 Project Overview

In this project, I built and shared a Docker container image using Amazon Elastic Container Registry (ECR) and deployed it across multiple AWS accounts. I worked with a project partner to simulate a real-world DevOps workflow where container images are built in one account and securely pulled and deployed in another.
This project demonstrates how cloud and DevOps teams manage container image sharing, cross-account access, and production deployments.


# 🏗 Architecture

Local Docker → Amazon ECR (Account A) → Elastic Beanstalk (Account B) → Public Web App
The container image is stored in a private ECR repository in one AWS account and securely pulled into another account for deployment.


# 🛠 AWS Services & Tools Used

| Service / Tool	| Purpose |
| --------------- | ------- |
| Docker	| Builds and tags container images |
| Amazon ECR	| Stores and shares Docker images securely |
| AWS CLI	| Authenticates and pushes/pulls images |
| AWS IAM	| Grants cross-account permissions |
| Elastic Beanstalk	| Deploys and runs the container |
| EC2 (managed by EB)	| Hosts the running container |
| Nginx	| Serves the web application inside the container |


# 🔧 What I Built

I created a Dockerized web application using Nginx and pushed it to my private Amazon ECR repository. My project partner then pulled this image from their own AWS account and deployed it using Elastic Beanstalk.

This simulates how engineering teams:

    Build images in one account (CI / build account)
    Deploy them in another account (prod / staging)


# ⚙️ Key Implementation Steps

1. Building the Container

I created:

    A Dockerfile that starts from the Nginx base image
    
    A custom index.html file containing the web app content

The Dockerfile copies the HTML file into Nginx’s default directory so the container serves the page when it runs 

2. Pushing to Amazon ECR

I authenticated Docker with ECR using:

    aws ecr get-login-password | docker login

Then I:

    Tagged the image with my ECR repository URI

Pushed it using:

    docker push 006834263464.dkr.ecr.us-east-1.amazonaws.com/nextwork/cross-account-docker-app:latest

This uploaded the image to Amazon ECR so it could be shared and deployed by others 

3. Cross-Account Permissions

When my partner first tried to pull the image, they received a 403 Forbidden error because:

ECR repositories are private by default.

We fixed this by updating the ECR repository policy to allow the other AWS account to perform:

    ecr:BatchCheckLayerAvailability
    ecr:BatchGetImage
    ecr:GetDownloadUrlForLayer

This enabled secure cross-account image access 

4. Deploying with Elastic Beanstalk

My partner used Elastic Beanstalk with a Dockerrun.aws.json file that:

    References the ECR image URI
    Pulls the latest image
    Exposes port 80

Elastic Beanstalk used an EC2 instance profile with ECR pull permissions to download and run the container 

5. Debugging Deployment

The first deployment failed because Elastic Beanstalk could not pull the container image.

We fixed this by ensuring:

    ECR repository policies allowed the other account
    The Beanstalk EC2 role had ECR read permissions

Once corrected, the container deployed successfully and the web app became accessible via the Elastic Beanstalk URL 


# 🧠 What I Learned

How Docker images are stored and versioned in ECR

How cross-account IAM and repository policies control image access

How Elastic Beanstalk pulls images from private ECR repositories

How to debug 403 Forbidden and image-pull failures

How real teams separate build and deploy accounts 


# 💼 Why This Project Matters

This project reflects real enterprise DevOps workflows:

    Centralized container image registries
    
    Secure cross-account access
    
    Separation of build and production environments
    
    Cloud-native container deployments

These are key skills for Cloud Engineers, DevOps Engineers, and Cloud Support Engineers.


# 🧹 Cost & Resource Cleanup

All ECR repositories, Elastic Beanstalk environments, IAM roles, and Docker resources were deleted after testing to avoid unnecessary AWS charges and security risks
