# 🛡 Build a Cloud Security Monitoring & Alerting System (AWS)


# 📌 Project Overview

In this project, I built an end-to-end security monitoring and alerting pipeline in AWS to detect when sensitive secrets are accessed and immediately notify administrators. I integrated AWS Secrets Manager, CloudTrail, CloudWatch Logs & Metrics, CloudWatch Alarms, and Amazon SNS to create a real-time security detection system similar to what is used in production cloud environments.
The goal was to understand how AWS logs, metrics, and notifications work together to detect, investigate, and respond to sensitive activity.


# 🏗 Architecture

Secrets Manager → CloudTrail → CloudWatch Logs → Metric Filter → Alarm → SNS → Email Alert
Whenever a secret is accessed, CloudTrail records the API call, CloudWatch detects it, and SNS sends an alert.


# 🛠 AWS Services Used

| Service |	Purpose |
| ------- | ------- |
| AWS Secrets Manager |	Stores sensitive secret data securely|
| AWS CloudTrail	| Logs API activity such as GetSecretValue|
| Amazon CloudWatch Logs	| Stores and searches CloudTrail logs|
| CloudWatch Metrics & Alarms	| Detects sensitive events and triggers alerts|
| Amazon SNS	| Sends email notifications|
| AWS IAM	 | Controls access to secrets and logs|
| AWS CLI	| Used to access secrets and generate events|


# 🔧 What I Built

I created a secret named TopSecretInfo in AWS Secrets Manager and configured CloudTrail to log Read API activity, specifically the GetSecretValue event used when someone retrieves a secret 
I then streamed CloudTrail logs into CloudWatch Logs, created a metric filter to count each time the secret was accessed, and configured a CloudWatch alarm to trigger whenever the metric was greater than zero. An SNS topic was connected to the alarm to send an email whenever the secret was accessed.


# ⚙️ Key Implementation Steps

1. Secret & CloudTrail Setup

I created a secret and enabled CloudTrail management event logging so that both console and CLI access to the secret would be recorded 

I verified this by retrieving the secret via:

    AWS Console
    AWS CLI (aws secretsmanager get-secret-value)

CloudTrail recorded both access events successfully.

2. Log-Based Detection

I configured CloudTrail → CloudWatch Logs and created a metric filter that matched:

    GetSecretValue

Each time this API call appeared in the logs, the metric increased by 1 

3. Real-Time Alerting

I set a CloudWatch alarm with a threshold of 1, meaning:

    If the secret is accessed even once, trigger an alert.

The alarm was connected to an SNS topic that sends an email notification whenever the alarm enters the ALARM state 

4. Troubleshooting the Pipeline

Initially, the secret access was logged but no email was sent. I troubleshot the entire pipeline by checking:

    CloudTrail event history
    
    CloudWatch log group integration
    
    Metric filter JSON pattern
    
    Alarm configuration
    
    SNS subscription confirmation

The root cause was that CloudTrail logs were not correctly flowing into CloudWatch Logs, so the metric never updated. After fixing the integration and filter, the alarm successfully triggered and SNS sent the email 


# 🧠 What I Learned

How to detect sensitive API activity using CloudTrail

How CloudWatch metric filters convert logs into metrics

How alarms and SNS create automated security alerts

The difference between CloudTrail Event History vs CloudWatch Logs

How to debug multi-service monitoring pipelines in AWS 


# 💼 Why This Project Matters

This project mirrors how real organizations:
    
    Monitor access to secrets
    
    Detect suspicious behavior
    
    Trigger security alerts
    
    Respond quickly to sensitive events

These are core responsibilities for Cloud Support Engineers, Cloud Engineers, and Cloud Security Engineers.


# 🧹 Cost & Resource Cleanup

All Secrets Manager secrets, CloudTrail trails, CloudWatch logs, alarms, and SNS topics were deleted after testing to prevent unnecessary charges and security risks 
