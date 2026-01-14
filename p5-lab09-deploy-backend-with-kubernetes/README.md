# ☸️ Deploy a Backend Application with Kubernetes on Amazon EKS


# 📌 Project Overview

In this project, I deployed a containerized Flask backend application to an Amazon EKS Kubernetes cluster using kubectl and Kubernetes manifests. The goal was to run the backend in a production-style, cloud-native environment, where Kubernetes manages container scheduling, scaling, networking, and self-healing.
This project demonstrates how modern backend services are launched and operated inside Kubernetes after infrastructure is provisioned.


# 🏗 Architecture

Amazon ECR → Kubernetes Deployment → Pods → Kubernetes Service → Users
Kubernetes pulls the backend container image from Amazon ECR, runs it as multiple pods, and exposes it through a Service with a stable endpoint.


# 🛠 AWS Services & Tools Used

| Service/Tool |	Purpose |
| ------------ | -------- |
| Amazon EKS	| Managed Kubernetes control plane |
| Kubernetes (kubectl)	| Deploys and manages workloads |
| Amazon ECR	| Stores backend container images |
| Docker	| Builds the backend container image |
| Amazon EC2	| Worker nodes running Kubernetes pods |
| eksctl	| Used earlier to provision the EKS cluster |
| AWS IAM	| Controls access to the EKS cluster |


# 🔧 What I Built

I prepared a Flask backend application for Kubernetes by:

    Packaging it into a Docker container
    Pushing the image to Amazon ECR
    Creating Kubernetes Deployment and Service manifests
    Deploying the backend into an EKS cluster using kubectl

Once deployed, Kubernetes automatically pulled the image, created pods, and kept the backend running according to the desired state.


# ⚙️ Key Implementation Steps

1. Kubernetes Cluster Setup

I launched an Amazon EKS cluster using eksctl, which created:

    The Kubernetes control plane
    EC2 worker nodes (node group)
    Networking and IAM roles

This provided the infrastructure needed to run Kubernetes workloads 

2. Backend Container Image

I cloned the backend source code and built a Docker image using the provided Dockerfile. The image:

    Installed required dependencies
    Copied backend code into the container
    Defined how the Flask app starts

I pushed the image to Amazon ECR, which acts as a centralized container registry for Kubernetes to pull from when creating pods 

3. Kubernetes Manifests

I created two Kubernetes manifests:

  Deployment manifest

    Defines how many backend pods should run
    Ensures failed pods are automatically replaced
    Specifies the ECR image to pull

  Service manifest

    Exposes the backend using a NodePort Service
    Routes traffic to all healthy pods
    Provides a stable access point even as pods change

These manifests declaratively define how the backend should run in the cluster 

4. Deploying with kubectl

I installed and configured kubectl and connected it to my EKS cluster. I then deployed the backend by running:

    kubectl apply -f flask-deployment.yaml
    kubectl apply -f flask-service.yaml

Kubernetes responded by:

    Pulling the image from ECR
    Creating backend pods
    Exposing the backend through the Service

This confirmed the backend was successfully deployed and running.

5. Verifying the Deployment

I verified the deployment using:

    kubectl get pods
    kubectl get services

I also used the AWS EKS Console to visually inspect:

    Pod status and events
    Node assignment
    Image pull and container startup

To access the cluster via the console, I created an IAM access entry for my user and attached the AmazonEKSClusterAdminPolicy, enabling full visibility and management of Kubernetes resources 


# 🧠 What I Learned

How kubectl is used to manage Kubernetes workloads

How Kubernetes pulls images from Amazon ECR

How Deployments maintain desired state and self-heal pods

How Services expose applications reliably

How IAM integrates with EKS access control

How to verify and troubleshoot Kubernetes deployments using CLI and console


# 💼 Why This Project Matters

This project reflects real-world cloud-native backend deployment workflows:

    Running containerized backends in Kubernetes
    Declarative deployment using manifests
    Automated scaling and recovery
    Secure access to managed clusters

These are core skills for Cloud Engineers, DevOps Engineers, and Platform Engineers working with Kubernetes in production.


# 🧹 Cost & Resource Cleanup

After testing, I deleted:

    Kubernetes Deployments
    Kubernetes Services

The EKS cluster and EC2 node groups were cleaned up separately to avoid unnecessary AWS charges
