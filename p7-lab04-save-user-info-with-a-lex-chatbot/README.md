🤖 Save User Information with an Amazon Lex Chatbot (Context Carryover)
📌 Project Overview

In this project, I enhanced an Amazon Lex chatbot (BankerBot) to remember user information across intents using context carryover. By configuring input and output context tags, the chatbot can reuse previously collected details—such as a user’s date of birth—when handling follow-up requests, without asking the same questions again.

This project focuses on building stateful, natural conversations while balancing user experience, privacy, and security.

🏗 Architecture

User → Amazon Lex → CheckBalance Intent → Context Tags → FollowUpCheckBalance Intent

Amazon Lex stores context temporarily during a conversation and uses it to control which intents can be triggered and what information can be reused.


# 🛠 AWS Services & Tools Used

| Service/Tool	| Purpose |
| ------------- | -------- |
| Amazon Lex	| Builds and manages the conversational chatbot |
| AWS IAM	| Provides secure permissions for Lex |
| Amazon CloudWatch	 | Logs chatbot activity for visibility and debugging |


# 🔧 What I Built

I extended BankerBot so it can:

    Save user information after a successful balance check
    
    Reuse that information in follow-up requests
    
    Avoid repeatedly asking sensitive questions
    
    Control how long user data is remembered

This results in a smoother, more realistic conversational flow.


# ⚙️ Key Implementation Steps

1. Understanding Context Tags

Context tags in Amazon Lex allow information to be shared between intents during a conversation. There are two types:

    Output context tags: Set after an intent runs and pass information forward
    
    Input context tags: Control when another intent is allowed to run

Together, they allow the chatbot to remember what has already happened and respond intelligently 

2. Creating an Output Context

I created an output context tag named contextCheckBalance in the CheckBalance intent.
This context indicates that the user has successfully checked their balance and that related information (such as date of birth) can be reused later in the conversation 

3. Creating a Follow-Up Intent

I created a new intent called FollowUpCheckBalance, designed to handle follow-up questions like:

    “What about my savings account?”
    
    “Check my other account”

This intent reuses previously collected information instead of asking the user for their date of birth again, creating a more natural experience 

4. Linking Intents with Input Context

I configured FollowUpCheckBalance with an input context tag (contextCheckBalance).
This ensures the follow-up intent can only be triggered after the CheckBalance intent has already run successfully, preventing errors and unintended intent matching 

5. Testing Context Carryover

I tested the chatbot by:

    Checking one account balance
    
    Asking for another account balance in the same conversation

The chatbot correctly reused the saved date of birth and did not ask for it again.
Without context tags, Lex would either fail to trigger the follow-up intent or prompt the user for the same information again 

6. Managing Context Expiry

To balance usability and privacy, I updated the context expiry to:

    1 turn or 5 seconds

This means BankerBot quickly forgets sensitive information like date of birth, reducing privacy risk.

I also learned that:

    Longer expiry is useful for extended conversations
    
    Shorter expiry is better when handling sensitive data 


# 🧠 What I Learned

How context carryover enables stateful conversations

The difference between input and output context tags

How to design follow-up intents without repeating questions

How context expiry affects privacy and user experience

Why context management is critical for production chatbots 

Save User Info with a Lex Chatb…


# 💼 Why This Project Matters

This project mirrors real-world chatbot behavior:

    Banking and customer-support assistants
    
    Multi-step conversations
    
    Reduced friction for users
    
    Improved privacy handling

These skills are valuable for Cloud Engineers, Cloud Support Engineers, and teams building conversational AI on AWS.


# 🧹 Cost & Resource Cleanup

After testing, I deleted the Amazon Lex chatbot configuration and related IAM resources to avoid unnecessary costs and keep the AWS account clean
