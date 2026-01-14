# 🤖 Add Custom Slots to an Amazon Lex Chatbot


# 📌 Project Overview

In this project, I enhanced an existing Amazon Lex chatbot (BankerBot) by adding custom slots to collect required user information in a structured and conversational way. The chatbot guides users through checking their bank account balance by intelligently capturing details such as account type and date of birth, validating inputs, and handling errors without breaking the conversation flow.
This project focuses on designing natural, user-friendly conversational logic using slots, slot prompts, and failure responses.


# 🏗 Architecture

User Input → Amazon Lex → Intent (CheckBalance) → Slots → Validated Response
Amazon Lex extracts structured data from natural language input and uses it to fulfill the user’s request.


# 🛠 AWS Services & Tools Used

| Service/Tool	| Purpose |
| ------------- | ------- |
| Amazon Lex	| Builds and manages the conversational chatbot |
| AWS IAM	| Provides permissions for Lex execution |
| Amazon CloudWatch	| Logs chatbot activity for debugging |


# 🔧 What I Built

I extended BankerBot by:

    Creating custom slot types
    
    Associating slots with an intent
    
    Adding slot placeholders in utterances
    
    Configuring slot prompts and failure responses

This allowed the chatbot to collect required information naturally while keeping the conversation smooth and focused.


# ⚙️ Key Implementation Steps

1. Understanding Slots

Slots are pieces of information a chatbot must collect to fulfill an intent. In this project, slots were used to capture:
    
    Account type
    
    Date of birth

By using slots, BankerBot can extract required details automatically instead of asking repetitive follow-up questions 

2. Creating Custom Slot Types

I created a custom slot type for bank account categories with:

    Restricted slot values
    
    Synonyms for each value

This ensures the chatbot only accepts valid account types and re-prompts the user if an invalid value is provided 

3. Connecting Slots with an Intent

I associated the custom slots with the CheckBalance intent. This allows BankerBot to:

    Collect the account type first
    
    Then request the date of birth
    
    Store both values before fulfilling the request

Lex automatically manages the order of slot elicitation based on intent configuration 

4. Using Slot Values in Utterances

I updated sample utterances to include slot placeholders, such as:

    Check my {accountType} account balance
    
    What’s my balance for my {accountType} account, my birthday is {dateOfBirth}

This teaches Lex where to extract slot values directly from natural language input 

5. Handling Invalid Slot Input

To improve user experience, I configured slot prompts and failure responses for the dateOfBirth slot:

    Added multiple prompt variations
    
    Displayed follow-up messages only after invalid input
    
    Prevented the conversation from jumping to FallbackIntent

I changed the “Next step in conversation” setting so Lex:

    Re-elicits the same slot
    
    Skips repeating the initial prompt
    
    Waits for valid input before continuing

This keeps the conversation focused and user-friendly 


# 🧠 What I Learned

How custom slot types improve chatbot accuracy

How restricted slot values enforce valid input

How slot placeholders enable natural language extraction

How to design failure responses without breaking conversation flow

Why fine-tuning slot behavior is critical for good conversational UX 


# 💼 Why This Project Matters

This project mirrors real-world conversational AI design:
    
    Banking and customer support bots
    
    Secure identity verification flows
    
    Error-tolerant conversational systems
    
    Natural and intuitive user experiences

These skills are valuable for Cloud Engineers, Cloud Support Engineers, and AI-enabled application teams working with AWS.


# 🧹 Cost & Resource Cleanup

After testing, the Amazon Lex chatbot configuration and related IAM resources were deleted to avoid unnecessary costs and keep the AWS account clean 
