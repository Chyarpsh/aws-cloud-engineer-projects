# 🤖 Build an Intelligent Chatbot with Amazon Lex (Conversational AI)


# 📌 Project Overview

In this project, I built an intelligent conversational chatbot using Amazon Lex that can understand natural language input and respond intelligently through text. The chatbot, BankerBot, was designed to simulate real-world use cases such as customer support and banking assistance by recognizing user intent, handling unknown inputs gracefully, and responding in a natural, user-friendly way.
The focus of this project was learning the fundamentals of conversational AI, including intents, utterances, confidence scores, fallback handling, and response design.


# 🏗 Architecture

User Input (Text) → Amazon Lex → Intent Classification → Bot Response
Amazon Lex processes user input, maps it to the correct intent based on confidence, and returns an appropriate response.


# 🛠 AWS Services & Tools Used

| Service/Tool |	Purpose |
| ------------ | -------- |
| Amazon Lex	| Builds and manages the conversational chatbot |
| AWS IAM	| Provides secure permissions for Lex execution |
| Amazon CloudWatch |	Logs chatbot activity and debugging data |


# 🔧 What I Built

I created a chatbot named BankerBot from scratch in Amazon Lex. The bot was configured to:

Recognize greetings and respond naturally

Handle unrecognized inputs using a customized FallbackIntent

Use confidence thresholds to avoid incorrect responses

Improve user experience through response variations and initial responses

This resulted in a chatbot that feels polished, conversational, and user-friendly rather than robotic.


# ⚙️ Key Implementation Steps

1. Chatbot Creation

I created a new Amazon Lex bot and configured:

    Language and basic behavior
    
    An IAM role with least-privilege permissions
    
    Logging to CloudWatch for visibility and debugging

This setup allows the chatbot to run securely and reliably 

2. Intent Classification & Confidence Score

I kept the intent classification confidence score at the default value of 0.40, meaning:

    The chatbot must be at least 40% confident it understands user intent
    
    If confidence is lower, the request is routed to FallbackIntent

This prevents confusing or incorrect responses and improves reliability 

3. Creating the Welcome Intent

I created a WelcomeIntent to recognize greetings such as:
    
    “Hello”
    
    “Hiya”
    
    “Help me”

When triggered, the bot responds with a friendly welcome message, allowing conversations to start naturally. Testing confirmed the intent was correctly matched and fulfilled 

4. Handling Unknown Inputs with FallbackIntent

When users entered phrases like “How are you” or “Good morning,” the bot initially returned a technical error message because no intent matched. This happened because Amazon Lex routed the request to FallbackIntent when it could not confidently identify the user’s intent 

5. Customizing FallbackIntent

I customized FallbackIntent to return clear, friendly, and helpful responses instead of technical messages. I also added multiple variations, so the chatbot does not repeat the same fallback response every time.

Example improvements:

    “Hmm, could you try rephrasing that?”
    
    “I can help you find your account balance, transfer funds, or make a payment.”

This made the chatbot feel significantly more natural and user-friendly 

6. Adding Initial Responses

To further improve the user experience, I added initial responses to FallbackIntent. These are short messages displayed while the chatbot processes input, such as:

    “Hmmm, this is interesting…”
    
    “One moment…”
    
    “Oh no! Wait please…”

These responses reassure users that the chatbot is working and make interactions feel more human and engaging 


# 🧠 What I Learned

How conversational AI systems classify user intent

How confidence scores control response behavior

Why FallbackIntent design is critical for good UX

How response variations and initial responses improve realism

How small design choices significantly affect chatbot usability 


# 💼 Why This Project Matters

This project mirrors real-world chatbot development:

    Customer support automation
    
    Banking and financial assistants
        
    Conversational UX design
        
    Natural language understanding (NLU) fundamentals

These skills are valuable for Cloud Engineers, Cloud Support Engineers, and AI-enabled application teams working with AWS services.


# 🧹 Cost & Resource Cleanup

After testing, the Amazon Lex chatbot and associated IAM roles were deleted to avoid unnecessary costs and maintain a clean AWS account 
