# ☸️ Set Up and Manage a Kubernetes Deployment on Amazon EKS


# 📌 Project Overview

In this project, I deployed and managed a containerized application on an existing Amazon EKS Kubernetes cluster using Kubernetes manifests. I created a Deployment to run multiple replicas of the application, exposed it using a Service, and validated Kubernetes features such as self-healing, scaling, and rolling updates.
This project demonstrates how cloud and platform engineers run applications on Kubernetes after the cluster is provisioned.


# 🏗 Architecture

User → Kubernetes Service → Pods (Deployment) → EC2 Worker Nodes (EKS Node Group)
Kubernetes handles scheduling, scaling, and recovery of application pods across the cluster.


# 🛠 AWS Services & Tools Used

| Service/Tool |	Purpose |
| ------------ | -------- |
| Amazon EKS	| Managed Kubernetes control plane |
| Kubernetes (kubectl)	| Manages deployments, pods, and services |
| Amazon EC2	| Worker nodes running Kubernetes pods |
| Auto Scaling | Groups	Automatically replaces failed worker nodes |
| Docker	| Container image used by the deployment |
| eksctl	| Used earlier to provision the EKS cluster |


# 🔧 What I Built

I deployed a containerized web application to Kubernetes by defining a Deployment manifest that manages multiple pod replicas. The application runs inside containers scheduled across EKS worker nodes, and Kubernetes continuously ensures the desired number of pods is running.

I also created a Service to expose the application so it could be accessed externally.


# ⚙️ Key Implementation Steps

1. Kubernetes Deployment

I created a Kubernetes Deployment that:

    Uses a container image
    Runs multiple replicas for high availability
    Automatically recreates pods if they fail

Example command:

    kubectl apply -f deployment.yaml

This ensures the application remains available even if individual pods crash.

2. Service Exposure

I created a Kubernetes Service to expose the application:

    Routes traffic to healthy pods
    Abstracts pod IP addresses
    Enables stable access to the application

Example command:

    kubectl apply -f service.yaml

3. Verifying Cluster State

I verified the deployment by running:

    kubectl get deployments
    kubectl get pods
    kubectl get services

These commands confirmed that:

    Pods were running successfully
    The desired replica count was maintained
    The service was routing traffic correctly

4. Self-Healing Validation

To test Kubernetes self-healing, I manually deleted a running pod:

    kubectl delete pod <pod-name>

Kubernetes automatically created a replacement pod, proving that the Deployment controller enforces the desired state.

5. Scaling the Application

I scaled the deployment by increasing the number of replicas:

    kubectl scale deployment <deployment-name> --replicas=5

Kubernetes scheduled additional pods across available nodes without downtime.


# 🧠 What I Learned

How Kubernetes Deployments manage application lifecycle

How Services route traffic to pods

How Kubernetes enforces desired state

How self-healing works when pods fail

How to scale applications horizontally in Kubernetes


# 💼 Why This Project Matters

This project reflects real-world Kubernetes operations:

    Running applications in production clusters
    Maintaining availability through replicas
    Recovering automatically from failures
    Scaling workloads based on demand

These are core skills for Cloud Engineers, DevOps Engineers, and Platform Engineers.


# 🧹 Cost & Resource Cleanup

After testing, I deleted:

    Kubernetes deployments
    Kubernetes services

The EKS cluster was managed separately and cleaned up in the previous project to avoid unnecessary AWS charges.


