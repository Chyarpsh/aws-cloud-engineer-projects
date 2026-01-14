# ☸️ Create Kubernetes Deployment & Service Manifests on Amazon EKS


# 📌 Project Overview

In this project, I created Kubernetes Deployment and Service manifests to define how a containerized backend application should run and be exposed inside an Amazon EKS cluster. Rather than manually starting containers, I used YAML manifests to declaratively describe the desired state of the application, allowing Kubernetes to handle deployment, scaling, networking, and self-healing automatically.
This project focuses on one of the most important cloud-native skills: describing production systems using Kubernetes manifests.


# 🏗 Architecture

Amazon ECR → Kubernetes Deployment → Pods → Kubernetes Service → Users
Kubernetes pulls the container image from Amazon ECR, runs it as multiple pods, and exposes it through a Service with a stable network endpoint.


# 🛠 AWS Services & Tools Used

| Service/Tool |	Purpose |
| ------------ | -------- |
| Amazon EKS	| Managed Kubernetes control plane |
| Kubernetes (kubectl)	| Applies and manages manifests |
| Docker	| Packages the backend application |
| Amazon ECR	| Stores container images |
| eksctl	| Provisioned the EKS cluster |
| Amazon EC2	| Worker nodes running Kubernetes pods |


# 🔧 What I Built

I created two core Kubernetes manifests:

  Deployment Manifest

  Defines how the backend application runs, including:

    Container image location (Amazon ECR)
    Number of replicas
    Labels and selectors
    Pod lifecycle and self-healing behavior

  Service Manifest

  Exposes the running pods through a NodePort Service, allowing users and other services to access the backend consistently, even as pods are created or replaced.


# ⚙️ Key Implementation Steps

1. Backend Container Image

I built a Docker image for the backend application and pushed it to Amazon ECR so Kubernetes could pull the image when creating pods. Kubernetes cannot deploy images stored only on a local machine, so using ECR was required for cluster-wide access 

2. Deployment Manifest

The Deployment manifest declares the desired state of the application. A key configuration was:

    Replicas: 3

This instructs Kubernetes to always keep three identical pods running. If one pod fails, Kubernetes automatically replaces it to maintain availability.

The Deployment uses:

    Labels to tag pods
    Selectors to determine which pods the Deployment manages

This ensures Kubernetes consistently controls the correct set of application pods 

3. Service Manifest

I created a NodePort Service that:

    Exposes the backend on port 8080
    Routes traffic to all healthy pods labeled app: nextwork-flask-backend
    Provides a stable network endpoint regardless of pod restarts or scaling

This separates network access from pod lifecycle management, which is a core Kubernetes design principle 

4. Applying the Manifests

I deployed the application by running:

    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml

Kubernetes then:

    Pulled the image from ECR
    Created pods
    Exposed the application through the Service

I verified the deployment using:

    kubectl get deployments
    kubectl get pods
    kubectl get services


# 🧠 What I Learned

How Kubernetes uses manifests to declare desired state

How Deployments manage replicas, scaling, and self-healing

How Services abstract pod networking

How labels and selectors connect Deployments, Pods, and Services

Why manifest-based workflows are essential for production Kubernetes systems 


# 💼 Why This Project Matters

This project reflects real cloud-native engineering practices:

    Declarative infrastructure and application definitions
    Scalable, self-healing workloads
    Clean separation between application logic and networking

These are core skills for Cloud Engineers, DevOps Engineers, and Platform Engineers working with Kubernetes in production environments.


# 🧹 Cost & Resource Cleanup

After testing, I deleted:

    Kubernetes Deployments
    Kubernetes Services

The EKS cluster and node groups were cleaned up separately to avoid unnecessary AWS charges 

