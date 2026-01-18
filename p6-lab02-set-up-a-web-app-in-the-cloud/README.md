
# 🌐 Set Up a Web Application in the Cloud Using AWS & VS Code


# 📌 Project Overview

In this project, I set up a Java-based web application entirely in the cloud by launching an Amazon EC2 instance, connecting to it securely using SSH, and developing the application remotely using VS Code Remote – SSH. I installed Java (Amazon Corretto) and Apache Maven on the EC2 instance, generated a starter Java web app, and edited application files directly on the cloud server.
This project demonstrates real-world remote development workflows, server setup, and hands-on cloud computing fundamentals used by cloud and DevOps engineers.


# 🏗 Architecture

Local Machine (VS Code) → SSH → Amazon EC2 → Java Web Application
VS Code connects securely to the EC2 instance, allowing code editing and execution directly on the cloud server.


# 🛠 AWS Services & Tools Used

| Service/Tool |	Purpose |
| ------------ | -------- |
| Amazon EC2	| Hosts the cloud-based web application |
| AWS IAM	| Manages secure access using key pairs |
| SSH	| Secure remote server access |
| VS Code	| Remote development environment |
| VS Code | Remote – SSH	Enables IDE access to EC2 |
| Apache Maven	| Builds and manages the Java project |
| Amazon Corretto (Java) |	Runs the Java web application |


# 🔧 What I Built

I launched a Linux-based EC2 instance and configured it as a remote development server. On this server, I:

    Installed Java and Maven
    Generated a starter Java web application using Maven archetypes
    Edited application files using VS Code Remote – SSH
    Verified changes both via terminal and IDE

This setup mirrors how developers work with cloud servers in professional environments.


# ⚙️ Key Implementation Steps

1. Launching the EC2 Instance

I launched an Amazon EC2 instance with:

    A secure key pair for authentication
    SSH access enabled via security group rules

The EC2 instance provides a cloud-based virtual server where the application can be built and managed 

2. Secure SSH Access

I downloaded the private key file (.pem) and updated its permissions using:
    
    chmod 400 nextwork-keypair.pem

This ensured secure, passwordless SSH authentication when connecting to the EC2 instance 

3. Connecting via VS Code Remote – SSH

I installed VS Code and the Remote – SSH extension to connect directly to the EC2 instance.
This allowed me to:

    Open files visually
    Use an integrated terminal
    Edit code on the remote server as if it were local

This significantly improved productivity compared to terminal-only editing 

4. Installing Java & Maven

On the EC2 instance, I installed:

    Amazon Corretto 8 (Java runtime)
    Apache Maven (build automation tool)

These tools are required to compile, build, and manage Java-based web applications in the cloud 

5. Creating the Java Web Application

I generated a starter Java web app using Maven:

    mvn archetype:generate \
    -DgroupId=com.nextwork.app \
    -DartifactId=nextwork-web-project \
    -DarchetypeArtifactId=maven-archetype-webapp \
    -DinteractiveMode=false

This automatically created a standard project structure including:

    src/main/webapp
    WEB-INF
    index.jsp
    pom.xml

I explored and edited these files using VS Code connected to the EC2 instance 

6. Editing with IDE vs Terminal

To deepen my understanding, I edited index.jsp in two ways:
  
    Using VS Code Remote – SSH
    Using the terminal-based editor nano

Editing via the IDE was faster and more intuitive due to syntax highlighting and file navigation, while terminal editing provided insight into low-level server interactions 


# 🧠 What I Learned

How to launch and secure EC2 instances

How SSH key-based authentication works

How to perform remote development using VS Code

How Maven structures Java web applications

Differences between IDE-based and terminal-based editing

Real-world cloud development workflows used by engineers 


# 💼 Why This Project Matters

This project reflects real cloud engineering practices:

Developing directly on cloud servers

Secure remote access using SSH

Environment setup and dependency management

Hands-on experience with EC2 and Java build tools

These skills are foundational for Cloud Engineers, DevOps Engineers, and Cloud Support Engineers.


# 🧹 Cost & Resource Cleanup

After completing the project, the EC2 instance and associated resources were terminated to avoid unnecessary AWS charges and maintain a clean account 



