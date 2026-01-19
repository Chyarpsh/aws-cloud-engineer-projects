# 🔐 Secure Packages with AWS CodeArtifact (Private Artifact Repository)


# 📌 Project Overview

In this project, I implemented a secure, private package management workflow using AWS CodeArtifact for a Java web application running on Amazon EC2. I configured CodeArtifact as a private Maven repository, secured access using IAM roles and temporary authorization tokens, and integrated it with Apache Maven to securely retrieve dependencies.
As an extension, I published my own custom package to CodeArtifact, verified its integrity using SHA-256 hashing, and downloaded it back to validate the full artifact lifecycle. This project demonstrates how modern DevOps teams securely manage dependencies and artifacts in production CI/CD pipelines.


# 🏗 Architecture

EC2 (Java App + Maven) → AWS CodeArtifact → Upstream (Maven Central)
CodeArtifact acts as a secure, private cache and source of truth for application dependencies and internal packages.


# 🛠 AWS Services & Tools Used

| Service/Tool |	Purpose |
| ------------ | -------- |
| AWS CodeArtifact	| Private artifact repository for packages |
| AWS IAM	| Secure access using roles and policies |
| Amazon EC2	| Hosts the Java web application |
| AWS CLI	| Authenticates and interacts with CodeArtifact |
| Apache Maven | Builds the Java application and resolves dependencies|
| AWS STS	| Provides temporary credentials |
| SHA-256 | Hashing	Verifies artifact integrity |


# 🔧 What I Built

I created a CodeArtifact domain and repository and configured it as the central package source for a Java web application. The repository:

Pulls dependencies from Maven Central via an upstream connection

Caches approved packages inside AWS

Restricts access using IAM permissions

I then validated the setup by compiling the application with Maven and confirming that dependencies were securely fetched and stored in CodeArtifact.


# ⚙️ Key Implementation Steps

1. CodeArtifact Domain & Repository

I created a CodeArtifact domain (nextwork) and a repository configured with Maven Central as an upstream source. This allows the repository to:

    Fetch public dependencies when needed
    Cache them for faster and more reliable future build
    Reduce reliance on external public repositories 

2. Securing Access with IAM Roles

Initially, authentication failed with:

    Unable to locate credentials

This occurred because the EC2 instance did not have permissions to access CodeArtifact.

I fixed this by attaching an IAM role to the EC2 instance that grants permissions to:

    Retrieve authorization tokens
    Access repository endpoints
    Read packages using temporary STS credentials

Using IAM roles ensures short-lived credentials, least privilege, and improved security 

3. Maven Integration

I configured Maven using a custom settings.xml file that:

    Authenticates to CodeArtifact using a temporary token
    Activates a CodeArtifact profile by default
    Mirrors all dependency requests through the CodeArtifact Maven endpoint

I then compiled the application, which caused Maven to pull dependencies through CodeArtifact instead of directly from Maven Central 

4. Verifying Dependency Caching

After compilation, I verified the CodeArtifact repository and confirmed that:

    Maven dependencies and plugins (Apache, JUnit, Log4j, Maven artifacts)
    Appeared with recent publish timestamps

This confirmed that CodeArtifact successfully cached dependencies during the build process 

5. Publishing a Custom Package (Project Extension)

As an extension, I published my own internal package to CodeArtifact:

    Created a custom file (secret-mission.txt)
    Bundled it into a compressed archive
    Generated a SHA-256 checksum to verify integrity
    Uploaded it as version 1.0.0 of a private package

This simulates how teams share internal libraries and utilities securely without exposing them publicly 

6. Validating Artifact Integrity

I downloaded the custom package directly from CodeArtifact and extracted it locally.

The contents matched exactly, confirming that:

    The artifact was stored correctly
    The download was successful
    The package was not corrupted or altered

This validated the full publish-and-retrieve lifecycle of a secure artifact 


# 🧠 What I Learned

How private artifact repositories secure dependencies

How IAM roles and temporary tokens protect access

How Maven integrates with AWS CodeArtifact

How upstream repositories improve reliability

How to verify artifact integrity with SHA-256 hashes

How real DevOps teams manage internal packages securely 


# 💼 Why This Project Matters

This project mirrors real enterprise DevOps practices:

    Secure dependency management
    Reduced supply-chain risk
    Faster, more reliable builds
    Foundation for CI/CD pipelines

These skills are essential for Cloud Engineers, DevOps Engineers, and Cloud Support Engineers.


# 🧹 Cost & Resource Cleanup

After testing, I deleted:

    CodeArtifact repositories and domain
    IAM roles and policies
    EC2 resources

This ensured no unnecessary costs or security risks remained
