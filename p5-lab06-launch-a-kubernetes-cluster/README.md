# ☸️ Launch and Operate a Kubernetes Cluster on AWS (Amazon EKS)


# 📌 Project Overview

In this project, I deployed a production-grade Kubernetes cluster on Amazon EKS using eksctl, which automatically provisions all required AWS infrastructure using CloudFormation. Ie objective was to understand how Kubernetes clusters are built, secured, and operated in real cloud environments.
This project simulates how cloud and DevOps engineers deploy, manage, and scale container platforms in AWS.


# 🏗 Architecture

EC2 (Admin VM) → eksctl → CloudFormation → Amazon EKS → EC2 Worker Nodes (Node Group)

eksctl uses CloudFormation to create:

    VPC
    
    Subnets
    
    Security Groups
    
    EKS control plane
    
    EC2 Auto Scaling Group for worker nodes 


# 🛠 AWS Services & Tools Used

| Tool / Service	| Purpose |
| --------------- | ------- |
| Amazon EKS	| Managed Kubernetes control plane |
| eksctl	 | CLI tool to create and manage EKS clusters |
| AWS CloudFormation	| Infrastructure-as-Code used by eksctl |
| Amazon EC2	| Worker nodes that run containers |
| Auto Scaling Groups	| Automatically maintains node count |
| AWS IAM	 | Controls access to the EKS control plane| 

# 🔧 What I Built

I created a fully functional EKS cluster with a managed node group.

The cluster was created using:

    eksctl create cluster

This command defined:

    Cluster name
    
    Region
    
    Kubernetes control plane
    
    Node group
    
    Networking
    
    IAM roles

eksctl automatically created two CloudFormation stacks:

    EKS control plane stack
    
    Node group stack (EC2 + Auto Scaling) 


# ⚙️ Key Engineering Challenges & Fixes

1. eksctl Not Found

The first attempt failed because I installed eksctl on my local machine, not on the EC2 instance where I was running AWS commands. I fixed this by installing eksctl inside the EC2 environment so the CLI could access AWS and create the cluster 

2. IAM AccessDenied Errors

The second failure occurred because the EC2 instance did not have permissions to:

    Create CloudFormation stacks
    
    Create EKS resources

I fixed this by attaching the correct IAM role to the EC2 instance, allowing eksctl to call AWS APIs and create infrastructure 

3. Kubernetes API Access

After the cluster was created, I configured an IAM Access Entry in the EKS console. This mapped my IAM user to Kubernetes RBAC and assigned:

    AmazonEKSClusterAdminPolicy

This gave me full administrative control over:

    Nodes
    
    Namespaces
    
    Workloads
    
    Cluster resources 



# ⚖️ Node Group & Auto-Healing

The cluster was configured with:
    
    Desired size: 3
    
    Minimum size: 1
    
    Maximum size: configurable

When I manually deleted EC2 instances:

    The Auto Scaling Group detected capacity loss
    
    AWS automatically launched replacement nodes
    
    Kubernetes re-registered them and continued running workloads

This demonstrated a self-healing, production-grade system 


# 🧠 What I Learned

How EKS clusters and node groups are architected

How CloudFormation underpins eksctl

How IAM and Kubernetes RBAC work together

How Kubernetes uses EC2 Auto Scaling for self-healing

How to debug tooling and permission failures during cluster creation 


# 💼 Why This Project Matters

This project mirrors real enterprise Kubernetes operations:

    Infrastructure-as-Code cluster provisioning
    
    Secure access to Kubernetes APIs
    
    Auto-scaling and self-healing nodes
    
    Production-grade container platforms

These are critical skills for Cloud Engineers, DevOps Engineers, and Platform Engineers.


# 🧹 Cost & Resource Cleanup

All EKS clusters, CloudFormation stacks, EC2 instances, and networking resources were deleted after testing to avoid unnecessary AWS charges 
