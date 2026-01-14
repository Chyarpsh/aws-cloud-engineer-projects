# 🎙️ Transcribe Audio & Video Files with AI using Amazon Transcribe


# 📌 Project Overview

In this project, I used Amazon Transcribe to convert audio and video files into accurate, searchable text using AI-powered speech-to-text capabilities. I processed both pre-recorded media and live speech, enhanced transcription accuracy using custom vocabularies and vocabulary filters, and generated subtitles for accessibility.
This project demonstrates how cloud-based AI services can transform unstructured audio into structured, usable data for analytics, accessibility, and real-world applications.


# 🏗 Architecture

Media File → Amazon S3 → Amazon Transcribe → Text / Subtitles / Real-Time Output
Amazon S3 stores the media files, while Amazon Transcribe processes them using AI models to generate transcripts.


# 🛠 AWS Services & Tools Used

| Service/Tool |	Purpose |
| ------------ | -------- |
| Amazon Transcribe	| AI-powered speech-to-text service |
| Amazon S3	| Stores audio and video files |
| Custom Vocabularies | Improves accuracy for domain-specific terms |
| Vocabulary Filters | Removes or masks unwanted filler words |
| Real-Time Transcription	| Converts live speech into text instantly |
| Subtitle Generation (SRT)	| Creates time-aligned captions |


# 🔧 What I Built

I created an end-to-end transcription workflow that:

    Stores media files securely in Amazon S3
    
    Runs baseline transcription jobs
    
    Improves accuracy using custom vocabularies
    
    Cleans transcripts using vocabulary filters
    
    Generates enhanced transcriptions and subtitles
    
    Supports real-time transcription for live speech

This allowed me to compare raw AI output with refined, production-quality transcripts.


# ⚙️ Key Implementation Steps

1. Media Storage with S3

I uploaded a video file containing spoken audio to Amazon S3, since Amazon Transcribe requires media files to be hosted in S3 before processing 

2. Baseline Transcription

I ran an initial baseline transcription job without any enhancements to establish a reference point.

The baseline transcript captured spoken language very literally, including:

    Filler words
    
    Repeated phrases
    
    Informal speech patterns
    
    Awkward punctuation

This helped identify what improvements were needed 

3. Custom Vocabulary

To improve accuracy, I created a custom vocabulary defining how specific words and phrases should be transcribed.

Examples included:

    Correct capitalization (e.g., “Player”)
    
    Fixing mis-transcribed technical terms
    
    Converting spoken phrases like “four-oh-three-forbidden” into 403 Forbidden

This significantly improved the clarity and correctness of the transcript 

4. Vocabulary Filtering

I implemented vocabulary filtering to automatically remove filler words such as:

    “uh”, “um”, “like”, “basically”, “yeah”, “okay”

Unlike custom vocabularies, filters do not change recognition accuracy—they clean the output after transcription, resulting in a more readable transcript 

5. Enhanced Transcription

I re-ran the transcription using both the custom vocabulary and vocabulary filter.

The enhanced transcript was:

    Cleaner and easier to read
    
    Free of filler words
    
    Correctly formatted for technical terms
    
    Better structured for analysis or subtitles 

6. Real-Time Transcription

As a project extension, I tested real-time transcription, which converts speech into text instantly as I spoke.

I observed that:
    
    Real-time transcription is ideal for live captions and accessibility
    
    Batch transcription is better for refining recorded media
    
    Custom vocabularies and filters can still be applied in real time 


# 🧠 What I Learned

How AI-powered speech-to-text works in AWS

Differences between baseline and enhanced transcription

How custom vocabularies improve recognition accuracy

How vocabulary filters clean transcripts

How real-time vs batch transcription differ in use cases

How transcription supports accessibility, analytics, and search 


# 💼 Why This Project Matters

This project mirrors real-world AI and cloud use cases:

    Transcribing meetings, lectures, and interviews
    
    Generating subtitles and captions
    
    Converting audio into analyzable text
    
    Improving accessibility with AI

These skills are valuable for Cloud Engineers, Data Analysts, AI Developers, and Cloud Architects.


# 🧹 Cost & Resource Cleanup

After testing, I deleted:

    Amazon Transcribe jobs
    
    Custom vocabularies and filters
    
    Amazon S3 media files

This ensured no unnecessary costs remained in the AWS account
