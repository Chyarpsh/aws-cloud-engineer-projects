# 🌍 Global Website Delivery with Amazon CloudFront

Secure, High-Performance AWS Content Delivery Architecture

Designed and deployed a globally distributed website using Amazon S3 and Amazon CloudFront with Origin Access Control (OAC), implementing private bucket security, signed origin access, and CDN caching to deliver content securely and with low latency worldwide.

# 🧠 Why This Project Matters

Real companies do not serve websites directly from S3.

They use CloudFront to:

    Improve global performance
    
    Protect origin servers
    
    Block direct public access
    
    Enforce secure access paths
    
    Reduce latency and cost

This project mirrors how Netflix, Airbnb, SaaS dashboards, and enterprise portals deliver content at scale.


# 🏗 Architecture Built

Component	Role
Amazon S3	Stores website files
CloudFront	Global content delivery network
Origin Access Control (OAC)	Secure private access to S3
Bucket Policy	Allows only CloudFront to read S3
CDN Cache	Speeds up website globally

The website was delivered globally using CloudFront while the S3 bucket remained private and inaccessible from the public internet 


# 🧩 Website Components

The website consisted of:

    File	Purpose
    index.html	Page structure and UI
    style.css	Layout and visual styling
    script.js	Calls an API and renders data

All files were tested locally to ensure the site loaded, styled correctly, and the JavaScript successfully fetched and displayed API data 

🔄 End-to-End Delivery Flow

1️⃣ S3 as the Origin

The website files were uploaded to an S3 bucket which acted as the origin for CloudFront 

2️⃣ CloudFront Distribution

A CloudFront distribution was created:

    Origin = S3 bucket
    
    Default root object = index.html
    
    Content cached across global edge locations

3️⃣ Initial Security Failure

When accessing the site via CloudFront, an AccessDenied error occurred because:

    The S3 bucket was private

CloudFront was not yet authorized

4️⃣ Origin Access Control (OAC) Implemented

OAC was configured so:

    CloudFront signs requests
    
    S3 only allows CloudFront access
    
    Public internet is blocked

This ensures:

    Users → CloudFront → S3 (secure)
    Public → ❌ Blocked

5️⃣ Bucket Policy Applied

The auto-generated OAC policy was added to the S3 bucket, explicitly allowing CloudFront to read objects while keeping the bucket private 


# 🔍 S3 vs CloudFront Comparison

| Feature | S3 Website | CloudFront + OAC |
| --- | --- | --- |
| Bucket Privacy | ❌ Must be public | ✅ Private |
| Security | Low | High |
| Global Performance | Regional | Global CDN |
| Access Control | Weak | Strong |
| Enterprise-Ready | ❌ | ✅ |

S3 hosting required public read access, exposing the bucket to the internet, while CloudFront allowed secure, private delivery through OAC 


# ⚡ Performance Results

CloudFront delivered the site faster than S3 because:

    Content was cached at edge locations
    
    Requests didn’t have to travel to the S3 region

This reduces:

    Latency
    
    Origin load
    
    Global user wait time



# 🔐 Security & CDN Concepts Demonstrated

This project proves production-level skills in:

    ✅ CDN architecture
    ✅ Origin Access Control (OAC)
    ✅ Private S3 hosting
    ✅ Signed origin requests
    ✅ Bucket policy security
    ✅ Performance optimization
    ✅ Global content delivery

# 🛠 AWS Services Used

    Amazon S3
    
    Amazon CloudFront
    
    Origin Access Control (OAC)
    
    S3 Bucket Policies
    
    AWS CDN Caching

# ⏱ Project Duration

~2 hours of real AWS engineering and troubleshooting
