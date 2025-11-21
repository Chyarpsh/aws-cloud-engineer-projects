# Lab 02 – Cloud Security with AWS IAM


This lab demonstrates how I implemented secure access control in AWS using Identity and Access Management (IAM).
The goal was to ensure that an intern-level user could only manage development EC2 instances, while production EC2 instances remained protected, using tags and custom IAM policies.

This folder contains:

Documentation PDF

Screenshots

IAM policy JSON 


---


# ⭐ Objective


To understand and implement:

IAM users & groups

Custom policies using JSON

Resource tagging for access control

IAM Policy Simulator for permission validation

Secure login using Account Alias


---


# 🔧 AWS Services Used


| Service |	Purpose |
| AWS IAM |	User groups, custom policies |
| Amazon EC2 |	Testing access and permission restrictions |
| IAM Policy Simulator |	Verify policy logic |


---


# 🧩 What I Built


---


1️⃣ Resource Tagging

I tagged EC2 instances with:

environment = production

environment = development

These tags were later used to allow or deny actions via IAM policies.


---


2️⃣ Custom IAM Policy

I created a JSON policy called NextWorkDevEnvironmentPolicy that:

✔️ Allows full EC2 access only on resources tagged:
"environment": "development"

❌ Denies EC2 access on resources tagged:
"environment": "production"

❌ Denies the ability to create or delete resource tags.

This ensured interns cannot modify production instances or tags.


---


3️⃣ Account Alias Setup

I configured an AWS Account Alias, allowing IAM users to log in through a human-readable URL instead of a long numerical account ID.


---


4️⃣ IAM Users & Groups

Created an Intern User Group

Attached the custom policy

Created an Intern IAM User

Assigned the user to the group

The intern inherits all permissions from the group.


---

# 🧪 Testing IAM Permissions


❌ Attempt to stop production EC2 instance

→ Access Denied
This confirmed that the policy successfully blocks production actions.

✔️ Attempt to stop development EC2 instance

→ Success
This validated correct and secure permissions.


---

# 🧰 IAM Policy Simulator Testing


I used the simulator to verify:

ec2:StopInstances

ec2:DeleteTags

Results:

Production instance: Denied

Development instance: Allowed

The simulator confirmed tag-based restrictions were working correctly.


---

# 🕒 Time Taken


~2 hours, including:

Designing the policy

Testing access

Validating changes

Writing documentation


---

# 🧠 Key Learnings


Tags are powerful for resource-level access control

IAM “Deny” ALWAYS overrides “Allow”

Least privilege principle is essential for cloud security

IAM Policy Simulator makes debugging easy

Proper tagging is critical for enforcing policy boundaries


---
