# 🏗 Infrastructure as Code with AWS CloudFormation (CI/CD at Scale)


# 📌 Project Overview

In this project, I rebuilt an entire end-to-end CI/CD infrastructure using Infrastructure as Code (IaC) with AWS CloudFormation. Instead of manually creating resources in the AWS Console, I defined my full deployment environment—including EC2, IAM roles, CodeDeploy, CodeArtifact, S3, and networking—inside a single CloudFormation template. The goal was to prove I can design repeatable, reliable, production-aligned infrastructure that avoids configuration drift and supports automated deployments, rollbacks, and future environment expansion (dev/test/prod) 


# 🏗 Architecture

GitHub → CodePipeline → CodeBuild → CodeArtifact → Amazon S3 → CodeDeploy → EC2
All infrastructure is created, updated, and deleted using CloudFormation stacks instead of manual clicks.


# 🛠 AWS Services & Tools Used

| Service/Tool |	Purpose |
| ------------ | -------- |
| AWS CloudFormation	| Infrastructure as Code |
| Amazon EC2	| Application & development server |
| AWS CodeDeploy	| Automated deployments |
| AWS CodeBuild	| Build and package automation |
| AWS CodePipeline	| End-to-end CI/CD orchestration |
| AWS CodeArtifact	| Secure dependency management |
| Amazon S3	| Artifact storage |
| AWS IAM	| Roles, policies & least-privilege access |
| GitHub	| Source code repository |
| Amazon CloudWatch	| Logs & monitoring |


# 🔧 What I Built

I created a single CloudFormation template that can:

Provision all CI/CD infrastructure from scratch

Enforce correct resource creation order
Eliminate manual setup and configuration drift
Be reused across environments
Be deleted safely to clean up all resources

This template now acts as a reusable CI/CD foundation for future projects.


# ⚙️ Key Implementation Steps

1. Generating an Initial CloudFormation Template

I used the CloudFormation IaC Generator to scan and discover existing AWS resources that I had previously built manually.

The generator produced an initial template that included:

    EC2 instances
    IAM roles and instance profiles
    CodeDeploy resources
    Security groups
    S3 buckets
    CodeArtifact domains and repositories

I then reviewed and refined this template to make it reusable and production-ready 

2. Understanding What Could Not Be Auto-Generated

Some resources could not be safely generated automatically, including:

    AWS CodeBuild projects
    CodeDeploy deployment groups

These require environment-specific configuration, service roles, and deployment hooks. I later manually defined them to ensure correct permissions and behavior 

3. Clean-Slate Testing Strategy

Before testing the template, I deleted all existing CI/CD resources from my AWS account, including:

    EC2 instances
    CodeDeploy applications
    CodeBuild projects
    CodeArtifact repositories
    S3 buckets
    IAM roles and policies

This ensured CloudFormation could recreate everything from scratch without naming conflicts and validated the template’s reliability 

4. Debugging Resource Creation Failures

My first stack deployment failed because some resources (like S3 buckets and IAM policies) already existed with the same names.CloudFormation stopped stack creation and rolled back partially created resources.
This reinforced how strict CloudFormation is about unique resource names and clean environments during IaC deployments 

5. Fixing Dependency Issues with DependsOn

I resolved deployment failures by explicitly controlling resource creation order using DependsOn.

Key fixes included:

    Ensuring IAM roles were created before policies attached to them
    Making CodeArtifact policies wait for both EC2 and CodeBuild roles

This prevented CloudFormation from referencing resources that didn’t exist yet and eliminated race conditions during stack creation 

6. Resolving Circular Dependency Errors

After adding DependsOn, CloudFormation detected circular dependencies between IAM roles and managed policies.

To fix this, I:

    Removed ManagedPolicyArns references from IAM role definitions
    Let managed policies attach to roles one-way only

This broke the dependency loop and allowed CloudFormation to calculate a valid creation order 

7. Manually Adding CI/CD Resources

As a project extension, I manually defined:

    An AWS CodeBuild project
    A CodeDeploy deployment group

I also replaced placeholder values with the exact logical IDs used elsewhere in the template to maintain consistency and avoid broken references. Additionally, I introduced CloudFormation Parameters (e.g., GitHub repo owner/name) to make the template reusable across projects and environments 

8. Successful Stack Deployment

After resolving dependency and configuration issues, I deployed the CloudFormation stack successfully.

I verified all resources by:

    Opening the CloudFormation Resources tab
    Confirming each service showed CREATE_COMPLETE status

This confirmed that the entire CI/CD infrastructure was successfully created and managed using Infrastructure as Code 


# 🧠 What I Learned

How Infrastructure as Code works in real production systems

How CloudFormation manages dependencies and resource order

How to debug stack creation failures

How circular dependencies occur and how to fix them

How to design reusable, parameterized templates

How IaC enables reliable CI/CD at scale 

Infrastructure as Code with Clo…


# 💼 Why This Project Matters

This project demonstrates senior-level cloud and DevOps skills:

Infrastructure automation

    CI/CD foundation design
    IAM and least-privilege security
    Failure debugging and recovery
    Production-aligned deployment workflows

These skills are highly valuable for Cloud Engineer, DevOps Engineer, and Cloud Support Engineer roles.


# 🧹 Cost & Resource Cleanup

After verification, I deleted the CloudFormation stack, which automatically removed:

    EC2 instances
    IAM roles and policies
    CI/CD services
    Storage resources

This ensured zero lingering cost and demonstrated clean infrastructure lifecycle management
