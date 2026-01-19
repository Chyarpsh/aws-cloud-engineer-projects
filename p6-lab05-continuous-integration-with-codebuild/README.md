# 🔄 Continuous Integration with AWS CodeBuild (CI Pipeline)


# 📌 Project Overview

In this project, I designed and implemented a production-style Continuous Integration (CI) pipeline using AWS CodeBuild. The pipeline automatically pulls source code from GitHub, installs dependencies, runs builds and tests using Apache Maven, securely retrieves packages from AWS CodeArtifact, and stores build artifacts in Amazon S3.
This project demonstrates how modern engineering teams use CI automation to catch errors early, reduce manual work, and ensure consistent, repeatable builds in real-world DevOps environments.


# 🏗 Architecture

GitHub → AWS CodeConnections → AWS CodeBuild → AWS CodeArtifact → Amazon S3
Every code change triggers an automated build that produces a deployable artifact.


# 🛠 AWS Services & Tools Used

| Service/Tool |	Purpose |
| ------------ | -------- |
| AWS CodeBuild	| Fully managed continuous integration service |
| AWS CodeConnections	 |Secure, managed GitHub integration |
| GitHub	| Source code repository |
| AWS CodeArtifact	| Secure private dependency repository |
| Amazon S3	| Stores build artifacts |
| AWS IAM	| Manages permissions for CI services |
| Amazon CloudWatch	| Build logs and monitoring |
| Apache Maven	 | Build automation and dependency management |
| buildspec.yml	 | Defines CI workflow and commands |


# 🔧 What I Built

I created a fully automated CI pipeline that:
    
    Pulls the latest code from GitHub
    Installs required runtimes and dependencies
    Authenticates securely to AWS CodeArtifact
    Compiles and packages a Java web application
    Runs automated tests during the build
    Uploads the final .war artifact to Amazon S3

This pipeline runs entirely on AWS-managed infrastructure with no servers to maintain.


# ⚙️ Key Implementation Steps

1. Creating the CodeBuild Project

I created an AWS CodeBuild project and configured:

    Source provider: GitHub (via AWS CodeConnections)
    Build environment: Amazon Linux with a managed CodeBuild image
    Runtime: Java (Amazon Corretto)
    Service role: IAM role with permissions for S3, CodeArtifact, and logs

This configuration ensures builds run in a secure, isolated environment managed by AWS 

2. Secure GitHub Integration

Instead of using personal tokens, I connected GitHub using AWS CodeConnections with a GitHub App.

This approach:
    
    Eliminates manual credential handling
    Automatically manages permissions
    Reduces security risk

This is the recommended production approach for AWS CI/CD pipelines 

3. Defining the Build Workflow (buildspec.yml)

The CI workflow is defined in a buildspec.yml file stored at the root of the repository.

It includes four phases:

    install: Sets up Java runtime
    pre_build: Generates a temporary CodeArtifact authorization token
    build: Runs mvn clean install with a custom Maven configuration
    post_build: Packages the application and prepares artifacts

Without this file, CodeBuild cannot execute the build, which caused my first build failure and reinforced how critical build specifications are 

4. Integrating AWS CodeArtifact

To securely pull dependencies, I integrated CodeBuild with AWS CodeArtifact.

During the pre_build phase, CodeBuild:

    Requests a temporary authorization token

Authenticates Maven to the private repository

I initially encountered a permission error during this step. I resolved it by:

    Updating the CodeBuild service role
    Granting permissions to request CodeArtifact tokens and read packages
    Once fixed, dependencies were successfully pulled and cached 

5. Artifact Storage in Amazon S3

I configured CodeBuild to upload build artifacts as a ZIP file to an Amazon S3 bucket. Artifacts represent the final, deployable output and can be reused by later pipeline stages such as CodeDeploy or CodePipeline.

After a successful build, I verified:

    The artifact appeared in S3
    All build phases showed Succeeded

This confirmed the CI process completed end-to-end 

6. Adding Automated Testing (Project Extension)

As an extension, I added automated tests to the CI pipeline.

The test script:

    Verifies required directories exist
    Confirms critical files (like index.jsp) are present
    Fails the build early if validation checks do not pass

I updated buildspec.yml to run the test script during the build phase, ensuring tests execute automatically on every build 


# 🧠 What I Learned

How continuous integration works in real-world teams

How to configure secure GitHub → AWS pipelines

Why buildspec.yml is critical for automation

How IAM permissions impact CI services

How to debug real CI failures and fix them systematically

How automated tests improve build reliability and confidence 

Continuous Integration with Cod…


# 💼 Why This Project Matters

This project mirrors real DevOps and cloud engineering workflows:

    Automated builds on every code change
    Secure dependency management
    Repeatable, reliable CI pipelines
    Foundation for full CI/CD automation

These skills are essential for Cloud Engineers, DevOps Engineers, and Cloud Support Engineers.


# 🧹 Cost & Resource Cleanup

After completing the project, I deleted:

    The CodeBuild project
    The S3 artifact bucket
    IAM roles and policies created for CI

This ensured no unnecessary AWS costs or unused resources remained
