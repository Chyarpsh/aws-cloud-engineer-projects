# 🤖 Build a Multi-Slot Banking Chatbot with Amazon Lex


# 📌 Project Overview

In this project, I enhanced an Amazon Lex banking chatbot (BankerBot) by implementing an advanced multi-slot intent that supports fund transfers between accounts. The chatbot collects multiple pieces of information in a single conversational flow, confirms the transaction with the user, and seamlessly transitions to follow-up intents using Lex’s visual conversation builder.
This project demonstrates how production chatbots manage complex user inputs, confirmation logic, and multi-intent workflows.


# 🏗 Architecture

User → Amazon Lex → TransferFunds Intent → Multiple Slots → Confirmation → Follow-Up Intent
Amazon Lex manages slot elicitation, confirmation prompts, and intent transitions without custom code.


# 🛠 AWS Services & Tools Used

| Service/Tool	| Purpose |
| Amazon Lex	| Builds and manages the conversational chatbot |
| AWS CloudFormation	| Deploys chatbot resources automatically |
| AWS Lambda	| Backend fulfillment and intent logic |
| AWS IAM	| Controls permissions for Lex and Lambda |
| Amazon CloudWatch	Logs | chatbot activity for debugging |
| Lex Visual Builder	| Designs conversation flows visually |


# 🔧 What I Built

I extended BankerBot with a new intent called TransferFunds, allowing users to move money between accounts in a single conversation. The chatbot:

    Collects multiple slot values
    
    Uses the same slot type twice for different purposes
    
    Confirms the transaction before completion
    
    Seamlessly transitions to another intent after fulfillment


# ⚙️ Key Implementation Steps

1. Multi-Slot Intent Design

I created a TransferFunds intent that captures:

    Source account type
    
    Destination account type
    
    Transfer amount

Because the transfer requires two account types, I reused the same custom slot type twice, assigning it to two different slots with different meanings (source vs destination) 

2. Confirmation Prompts

To prevent mistakes, I added confirmation prompts that ask the user to confirm or cancel the transfer before execution.

This ensures:

    Accidental transfers are avoided
    
    Users have a chance to review their request
    
    The chatbot behaves safely in a financial context 

3. Visual Conversation Builder

I used Amazon Lex’s visual builder to:

    View the full conversation flow
    
    Add Get Slot Value, Condition, and Go to Intent cards
    
    Debug how users move through intents and confirmations

This made it much easier to design and understand complex chatbot logic without manually managing every transition 

4. Seamless Intent Transition

After a successful transfer, I configured the chatbot to:

    Ask the user if they want to check an account balance
    
    Capture a Yes/No response using the AMAZON.Confirmation slot type
    
    Automatically route the user to the CheckBalance intent if they respond “Yes”

This creates a natural, continuous conversation without restarting the chatbot session 

5. CloudFormation Deployment

I deployed the chatbot using AWS CloudFormation, allowing:

    Fast and repeatable setup
    
    Consistent resource creation
    
    Easy re-deployment during testing

When deployment initially failed with an access denied error, I resolved it by:

    Creating a new Lambda function
    
    Updating the Lambda resource-based policy

Granting Amazon Lex permission to invoke the function using the correct bot alias ARN 


# 🧠 What I Learned

How to design multi-slot intents in Amazon Lex

How to reuse the same slot type for different roles

Why confirmation prompts are critical for sensitive actions

How the visual builder simplifies complex conversation flows

How CloudFormation enables fast, consistent chatbot deployment

How to debug Lex–Lambda permission errors 


# 💼 Why This Project Matters

This project mirrors real-world chatbot use cases:

    Banking and financial assistants
    
    Multi-step user interactions
    
    Error-safe transaction handling
    
    Seamless intent-to-intent transitions

These skills are highly relevant for Cloud Engineers, Cloud Support Engineers, and teams building conversational AI on AWS.


# 🧹 Cost & Resource Cleanup

After testing, I deleted:

    Amazon Lex bot and aliases
    
    AWS Lambda functions
    
    CloudFormation stacks

This ensured no unnecessary costs or unused resources remained in the AWS account
