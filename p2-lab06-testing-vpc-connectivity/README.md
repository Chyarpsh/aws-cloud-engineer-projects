# Testing VPC Connectivity 🌐

# 📌 Project Overview

This project focuses on testing and validating network connectivity within a VPC by examining SSH access, security group configurations, inter-instance communication, and internet connectivity from an EC2 instance. I also explored how VPC Peering requires explicit route table updates on both VPCs for connectivity to work a critical lesson in cloud networking.

# 🎯 Key Skills Demonstrated

🔐 Configuring security groups to allow SSH access

🖥️ Using EC2 Instance Connect for secure, passwordless logins

🔄 Testing inter-instance traffic with ping (ICMP)

🛠️ Troubleshooting connectivity using VPC subnet rules + security groups

🌍 Testing outbound internet reachability using curl

🔗 Understanding VPC peering routing requirements

📡 Comparing ICMP vs HTTP/S level connectivity

# What I Tested & Implemented

1. SSH Connectivity to Public Server 🔑

    Used EC2 Instance Connect, which generates temporary SSH keys and removes the need to manage keys locally
    
    First SSH attempt failed because the security group allowed only HTTP, not SSH
    
    Fixed by adding inbound SSH (port 22) from Anywhere-IPv4

2. Connectivity Between EC2 Instances (Ping Test) 📶

    Used ping to test communication from the Public Server to the Private Server
    
    Example:
    
    ping 10.0.1.151
    
    Ping reached the private instance’s IP, showing the request packets were sent
    
    Connectivity initially failed due to missing ICMP rules

3. Troubleshooting Instance-to-Instance Connectivity 🛠️

    To fix failed ping attempts:
    
      Updated private subnet’s NACL
      
      Added inbound & outbound rules allowing All ICMP – IPv4
      
      Source set to public subnet ID
      
      Updated the private instance’s security group
      
      Allowed inbound ICMP from the public server’s security group
      
      Retested ping → connectivity successful

4. Testing Public Internet Connectivity 🌍

    Used curl to verify outbound access from the public EC2 instance:
    
        curl example.com
        curl learn.nextwork.org
        curl https://learn.nextwork.org/projects/aws-host-a-website-on-s3

    Returned raw HTML, confirming successful HTTP/HTTPS connectivity
   

# 📚 Important Concepts Learned

    🔸 EC2 Instance Connect
    
    Browser-based SSH
    
    No need to store private keys locally
    
    Great for secure, temporary access
    
    
    🔸 ICMP (Ping) vs HTTP (Curl)
    
    Ping → tests basic network reachability (Layer 3, ICMP)
    
    Curl → tests application-level connectivity (Layer 7, HTTP/HTTPS)
    
    Together they help identify where the failure occurs


# 🤯 One Thing I Didn’t Expect

I expected VPC peering alone to allow connectivity — but discovered that each VPC’s route table must explicitly include routes to the peer VPC for traffic to flow.
This insight emphasized that networking is not just about linking VPCs, but also about ensuring routing paths exist on both sides.


# ⏱️ Time Spent

This project took 2 hours to complete.
