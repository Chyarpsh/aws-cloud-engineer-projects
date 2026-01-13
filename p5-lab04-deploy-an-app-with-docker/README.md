# 🐳 Deploy a Containerized Web App with Docker & AWS Elastic Beanstalk


# 📌 Project Overview

In this project, I containerized a web application using Docker and deployed it to AWS Elastic Beanstalk. The application was first built and tested locally inside a Docker container, then packaged as a custom image and deployed to the cloud as a fully managed web service.
This project demonstrates how modern cloud applications are packaged, deployed, and updated using container technology.


# 🏗 Architecture

Local Machine (Docker) → Custom Docker Image → AWS Elastic Beanstalk → Public Web URL
The same container image is used both locally and in AWS, ensuring consistent behavior across environments.


# 🛠 Technologies & Services Used

| Tool / Service	| Purpose |
| --------------- | ------- |
| Docker	| Builds and runs application containers |
| Docker Desktop	| Local Docker engine |
| Nginx	| Web server inside the container |
| AWS Elastic Beanstalk	| Managed platform for deploying Docker containers |
| Amazon EC2 (managed by EB)	| Hosts the running container |


# 🔧 What I Built

I created a custom Docker image based on Nginx that serves a web page from a custom index.html file. This image was:

    Built locally using a Dockerfile
    
    Tested using Docker containers
    
    Packaged into a ZIP file
    
    Deployed to AWS Elastic Beanstalk for production hosting 


# ⚙️ Key Implementation Steps

1. Running Containers Locally

I launched a standard Nginx container using:

    docker run -d -p 80:80 nginx

This allowed me to validate container networking and confirm Nginx was serving pages locally 

2. Building a Custom Docker Image

I created a Dockerfile that:

    Uses Nginx as the base image
    
    Copies my custom index.html into the web root
    
    Exposes port 80

I built the image using:

    docker build -t my-web-app .

This produced a reusable container image containing both Nginx and my web content 

3. Debugging Port Conflicts

When running my custom container, Docker failed because port 80 was already in use by another Nginx container. I fixed this by stopping the conflicting container before launching my own, allowing Docker to successfully bind the port 

4. Deploying to Elastic Beanstalk

I zipped the Dockerfile and index.html and uploaded them to Elastic Beanstalk, which:

    Provisioned EC2 instances automatically
    
    Built and ran my container
    
    Exposed the app via a public AWS URL

The first deployment failed due to packaging mistakes, including incorrect ZIP structure. I fixed this by ensuring the Dockerfile was at the root of the ZIP, then redeployed successfully 

5. Deploying App Updates

I modified index.html to add new text and images. The updates did not appear until I:

    Re-zipped the updated files
    
    Uploaded a new application version
    
    Deployed it to the existing Elastic Beanstalk environment

After redeployment, the new content appeared live on the Elastic Beanstalk URL 


# 🧠 What I Learned

How Docker images and containers differ

How to build and run custom Docker images

How Elastic Beanstalk deploys containerized apps

Why packaging and ZIP structure matters

How to safely update running cloud applications


# 💼 Why This Project Matters

This project reflects real cloud engineering workflows:

    Packaging apps with Docker
    
    Running containers locally and in the cloud
    
    Deploying and updating applications without managing servers

These are essential skills for Cloud Support Engineers, Cloud Engineers, and DevOps teams.


# 🧹 Cost & Resource Cleanup

All Elastic Beanstalk environments, EC2 instances, and Docker-related resources were deleted after testing to prevent unnecessary AWS charges
