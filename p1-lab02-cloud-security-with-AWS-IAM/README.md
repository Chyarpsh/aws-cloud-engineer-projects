Lab 02 – Cloud Security with AWS IAM

This lab demonstrates how I used AWS IAM (Identity and Access Management) to securely control access to AWS resources. The goal of the project was to understand how permissions, policies, tags, and IAM users work together to enforce strong cloud security.

This lab includes:

Documentation PDF

Screenshots

IAM policy JSON

Lab reflections and test results

⭐ Objective

Build and test a secure IAM permission system that ensures:

Intern-level users can ONLY manage development EC2 instances

Production EC2 instances are protected from unauthorized actions

IAM users log in through a custom account alias

Permissions are validated using the IAM Policy Simulator

🔧 AWS Services Used

AWS IAM

Amazon EC2

IAM Policy Simulator

🧩 What I Built & Learned
1️⃣ Resource Tagging

I tagged EC2 instances with:

environment = production

environment = development

(Ref: Screenshot and explanation on page 3 of the PDF) 

AWS_Security_IAM

Tags were later used inside IAM policies to allow or restrict actions.

2️⃣ Custom IAM Policy (JSON)

I created a custom policy that:

✔️ Allows the intern to perform any EC2 action (ec2:*)
✔️ BUT only on instances tagged with environment = development
✔️ Denies tag creation/deletion
✔️ Denies access to production instances

This is shown in the JSON policy section on pages 4–6 of the PDF. 

AWS_Security_IAM

3️⃣ Account Alias Setup

I created an AWS Account Alias, which replaces the numeric account ID with a human-readable login URL.

This step is documented on page 7 of the PDF. 

AWS_Security_IAM

4️⃣ IAM Users & Groups

Created a user group

Attached the custom NextWorkDevEnvironmentPolicy to the group

Created a new IAM user (Intern) inside the group

(Explained on pages 8–9 of the PDF) 

AWS_Security_IAM

Interns automatically inherit the development-only permissions.

5️⃣ Testing IAM Permissions
❌ Attempt to stop the production EC2 instance → Access Denied

This confirmed the policy prevented unwanted access
(Shown on page 10) 

AWS_Security_IAM

✔️ Attempt to stop the development instance → Success

This validated correct allowed permissions
(Shown on page 11) 

AWS_Security_IAM

6️⃣ IAM Policy Simulator Validation

Used the simulator to test:

StopInstances

DeleteTags

Confirmed that:

Production access = Denied

Development access = Allowed

(Shown on page 12) 

AWS_Security_IAM

📄 Files in This Folder
p2-lab02-cloud-security-with-aws-iam/
│
├── README.md
├── documentation/
│   └── AWS_Security_IAM.pdf
├── screenshots/
│   └── *.png
└── policy/
    └── iam_policy.json   (optional if you add it)

🕒 Project Duration

~2 hours

As stated in your reflection (page 2) 

AWS_Security_IAM

🧠 Key Takeaways

IAM policies require careful scoping

Tags provide powerful, flexible resource control

Deny permissions always override Allow

The IAM Policy Simulator is an essential security tool

Real-world IAM issues often come from incorrect tagging or missing resource ARNs

🎯 Outcome

This lab successfully proved:

IAM permissions can be enforced precisely

Production environments can be protected

Intern-level users can operate safely within defined boundaries
