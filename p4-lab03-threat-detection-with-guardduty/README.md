# 🚨 Cloud Threat Detection with Amazon GuardDuty


# 📌 Project Overview

In this project, I deployed an intentionally vulnerable AWS environment and used Amazon GuardDuty to detect real-world attack activity, including SQL injection, command injection, credential exfiltration, and malware uploads. I simulated attacker behavior and then investigated how AWS security services detect and report these threats in real time.
This project demonstrates how cloud security and operations teams monitor AWS environments, investigate incidents, and validate security controls.


# 🏗 Architecture

Attacker → Vulnerable EC2 Web App → Stolen IAM Credentials → AWS Resources → GuardDuty
GuardDuty analyzes data from CloudTrail, VPC Flow Logs, DNS logs, and S3 to detect abnormal and malicious behavior across the AWS environment 


# 🛠 AWS Services Used

| Service |	Purpose |
| ------- | ------- |
| Amazon GuardDuty	| Threat detection and anomaly-based security monitoring |
| GuardDuty Malware Protection |	Scans S3 and compute workloads for malware |
| AWS CloudFormation |	Deploys the vulnerable lab environment |
| Amazon EC2 |	Hosts the vulnerable web application (DVWA / Juice Shop) |
| Amazon S3	 | Stores files for malware testing |
| AWS IAM |	Manages roles and stolen credentials |
| AWS CloudShell & AWS CLI |	Used to simulate attacker behavior |


#🔧 What I Built

I launched a vulnerable web application on EC2 and intentionally exploited it using SQL injection and command injection. Through these attacks, I retrieved temporary IAM credentials from the EC2 metadata service and used them in CloudShell to simulate how a real attacker would pivot into AWS using stolen credentials 
I also enabled GuardDuty Malware Protection and validated it by uploading a safe EICAR test file into S3 to trigger a malware detection event.


# ⚙️ Key Attack & Detection Workflow

1. Vulnerable Environment Deployment

A CloudFormation template deployed:

    A public EC2 web app
    
    An S3 bucket with sensitive data
    
    IAM roles and logging required for GuardDuty monitoring 

2. Web Application Attacks

I performed:

    SQL Injection to bypass authentication
    
    Command Injection to execute OS commands and access the EC2 metadata service

This allowed me to extract temporary AWS credentials from the compromised instance 

3. Credential Exfiltration

Using CloudShell, I:

    Downloaded the stolen credentials
    
    Configured a new AWS CLI profile using the compromised access keys
    
    Simulated attacker access to AWS from a remote environment 

4. GuardDuty Findings

GuardDuty generated a high-severity finding:

    “Credentials for the EC2 instance role were used from a remote AWS account”

This confirmed that:

    The credentials were exfiltrated
    
    They were used outside their normal environment
    
    Anomaly-based detection successfully identified the compromise 

5. Malware Detection

I uploaded an EICAR test file to S3, which triggered a:

    High-severity Object:S3/MaliciousFile finding

This verified that GuardDuty Malware Protection was actively scanning and detecting malicious content in near real time 



# 🧠 What I Learned

How attackers exploit web vulnerabilities to access cloud resources

How EC2 instance role credentials can be exfiltrated

How GuardDuty uses anomaly detection to detect compromised credentials

How malware scanning protects S3 and compute workloads

How to investigate and interpret security findings in AWS 



# 💼 Why This Project Matters

This project mirrors real cloud security and incident response workflows:

    Detecting compromised credentials
    
    Identifying abnormal API usage
    
    Responding to malware threats
    
    Understanding attacker behavior in cloud environments

These are critical skills for Cloud Support Engineers, Cloud Engineers, and Cloud Security Engineers working in production AWS environments.


# 🧹 Cost & Resource Cleanup

All CloudFormation stacks, EC2 instances, S3 objects, GuardDuty findings, and test resources were deleted after the experiment to avoid unnecessary charges and to keep the AWS account secure
