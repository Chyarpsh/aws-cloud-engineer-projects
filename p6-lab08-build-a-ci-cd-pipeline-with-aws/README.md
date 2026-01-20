# 🔁 Build a Full CI/CD Pipeline with AWS CodePipeline


# 📌 Project Overview

In this project, I built a fully automated Continuous Integration and Continuous Deployment (CI/CD) pipeline using AWS CodePipeline. The pipeline connects GitHub (source), AWS CodeBuild (build), and AWS CodeDeploy (deploy) into a single, end-to-end workflow that automatically builds and deploys application changes to Amazon EC2. I validated the pipeline by pushing real code changes to GitHub and observing them deploy automatically. I also tested failure handling and rollback, proving that the pipeline can safely recover by redeploying a previously stable version—just like in real production environments 


# 🏗 Architecture

GitHub → AWS CodePipeline → CodeBuild → Amazon S3 → CodeDeploy → EC2
CodePipeline orchestrates the flow of artifacts across stages, ensuring every deployment is traceable to a specific Git commit.


# 🛠 AWS Services & Tools Used

|Service/Tool |	Purpose |
| ----------- | ------- |
| AWS CodePipeline	| Orchestrates the end-to-end CI/CD workflow |
| GitHub	| Source code repository |
| AWS CodeBuild	| Compiles, tests, and packages the application |
| Amazon S3	| Stores build artifacts |
| AWS CodeDeploy	| Deploys artifacts to EC2 and manages rollbacks |
| Amazon EC2	| Hosts the web application |
| AWS IAM	| Role-based access control |
| AWS CloudFormation	| Provisions supporting infrastructure |
| Amazon CloudWatch	| Logs and pipeline visibility |


# 🔧 What I Built

I created a three-stage CI/CD pipeline consisting of:

    Source stage – pulls code from GitHub using secure webhooks
    Build stage – compiles and packages the application using CodeBuild
    Deploy stage – deploys the artifact to EC2 using CodeDeploy

The pipeline runs automatically on every GitHub push, with no manual intervention required.


# ⚙️ Key Implementation Steps

1. Pipeline Creation & Execution Mode

I created a new CodePipeline and initially set the execution mode to Suspended, allowing me to fully configure and validate all stages before enabling automatic execution. This prevented unintended pipeline runs during setup and debugging 

2. Source Stage (GitHub Integration)

In the Source stage, I connected CodePipeline to GitHub using a secure connection and enabled webhook events. This ensures:

    The pipeline automatically triggers on every push or merge
    The correct branch is always used
    Each pipeline execution is linked to a specific Git commit

This enables real-time, event-driven CI/CD rather than manual or scheduled runs 

3. Build Stage (AWS CodeBuild)

The Build stage uses AWS CodeBuild to:

    Pull the source artifact from the Source stage
    Install dependencies
    Compile and package the application
    Produce a deployable artifact

The build process is defined in a buildspec.yml, ensuring builds are repeatable and consistent across executions 

4. Deploy Stage (AWS CodeDeploy)

In the Deploy stage, I configured CodeDeploy to:
    
    Use a predefined application and deployment group
    Target EC2 instances using instance tags
    Pull the build artifact from Amazon S3
    Execute lifecycle hooks defined in appspec.yml

CodeDeploy safely stops the existing application, installs the new version, and brings the service back online, handling retries and failures automatically 

5. End-to-End Automation Testing

To test the pipeline:

    I made a small code change locally
    Committed and pushed the change to GitHub
    Observed CodePipeline automatically trigger
    Verified Source, Build, and Deploy stages all succeeded
    Checked the live EC2-hosted web app

The updated content appeared exactly as expected, confirming end-to-end automation from GitHub to production 


# 🔄 Rollback & Disaster Recovery Testing

As a project extension, I tested rollback behavior by manually initiating a rollback in the CodeDeploy Deploy stage. CodePipeline:

    Skipped the Source and Build stages
    Reused a previously built and approved artifact
    Redeployed the last known good version to EC2

After rollback, the web application reverted to its earlier stable state, confirming that CodeDeploy successfully restored a healthy version without rebuilding. This demonstrates strong production-readiness and disaster-recovery practices 


# 🧠 What I Learned

How to design real-world CI/CD pipelines

How CodePipeline orchestrates artifact flow

How GitHub webhooks enable instant automation

How CodeBuild and CodeDeploy integrate seamlessly

How IAM permissions affect CI/CD services

How to debug pipeline failures

How manual and automatic rollbacks protect production systems 


# 💼 Why This Project Matters

This project reflects real production CI/CD workflows:

    Automated builds and deployments
    Zero-touch releases
    End-to-end traceability
    Safe rollback and recovery

These are core skills for Cloud Engineers, DevOps Engineers, and Cloud Support Engineers.


# 🧹 Cost & Resource Cleanup

After testing, I cleaned up:

    CodePipeline
    CodeBuild projects
    CodeDeploy applications and deployment groups
    EC2 instances
    S3 buckets
    IAM roles

This ensured no unnecessary AWS costs remained 
