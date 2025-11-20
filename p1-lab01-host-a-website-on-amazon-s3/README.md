# 🧪 Lab 01 — Host a Static Website on Amazon S3

---

## 🎯 Objective  
The goal of this lab was to learn how Amazon S3 can be used not only for cloud object storage but also to **host a fully functional static website**, while understanding how access, permissions, ACLs, and bucket policies affect public availability. :contentReference[oaicite:1]{index=1}

---

## 🧩 Concepts & Services Used  
| Concept / Service | Purpose |
|-------------------|---------|
| **Amazon S3** | Cloud object storage & static web hosting |
| **Static Website Hosting** | Serve HTML files publicly using S3 endpoint |
| **ACL (Access Control List)** | Object-level access permissions |
| **Bucket Endpoint** | Public website URL hosted by S3 |
| **Bucket Policy** | Fine-grained, rule-based access control |

These allowed me to understand **how hosting, access control, and public visibility work together** in AWS. :contentReference[oaicite:2]{index=2}

---

## 📍 Region Selection  
I selected the **US-East-1 (N. Virginia)** region because it is **closest to my location (San Marcos, Texas)**, helping minimize latency. :contentReference[oaicite:3]{index=3}

---

## 🚀 Project Steps

### 1️⃣ Create an S3 Bucket  
- Took less than **5 minutes** to create  
- Learned that **bucket names must be globally unique** across all AWS accounts and regions :contentReference[oaicite:4]{index=4}

### 2️⃣ Upload Website Files  
- Uploaded **index.html** and an **images folder**  
- Learned that HTML alone is not enough — **assets must be included** for full website rendering :contentReference[oaicite:5]{index=5}

### 3️⃣ Enable Static Website Hosting  
- Enabled via **Bucket → Properties → Static website hosting**  
- Set **index.html** as the entry document  
- Kept ACL enabled to compare with bucket policy behavior later :contentReference[oaicite:6]{index=6}

### 4️⃣ Test Website Using Endpoint  
- Copied the S3 **static hosting endpoint URL**  
- Initial testing returned **403 Forbidden** error :contentReference[oaicite:7]{index=7}

---

## 🐞 Issue Encountered — 403 Forbidden Error  
When testing the website, the endpoint showed a **403 error** because although **public access settings were adjusted**, **object files were still private** by default.  
This taught me that **disabling “Block Public Access” is not enough** — objects **must** allow public read. :contentReference[oaicite:8]{index=8}

---

## ✔️ Solution  
I **changed the ACL settings** of the files to **Public Read**, and once updated, the website loaded successfully via the S3 endpoint.  
This demonstrated **object-level vs bucket-level access control differences**. :contentReference[oaicite:9]{index=9}

---

## 🔐 Additional Security Experiment — Bucket Policy  
I tested a **deny policy** that **prevented deletion of index.html** by anyone.  
When I attempted to delete the file, AWS returned a **Permission Denied** message, confirming the policy worked correctly. :contentReference[oaicite:10]{index=10}

---

## ⏱️ Time Taken  
Approx. **2 hours total** (including debugging + retesting).  
Most challenging part: Resolving **403 forbidden error**  
Most rewarding moment: Seeing the webpage **successfully load after refresh** 💪

---

## 🧠 Key Learnings  
- Bucket URL ≠ Website endpoint URL  
- Public access requires **object-level permissions**, not only bucket settings  
- **ACLs** allow public object hosting but are **not recommended long-term**  
- **Bucket policies** offer **more granular and secure** access control  
- Static hosting means **no backend logic** — only HTML/CSS/JS

---

## 🔮 Future Enhancements  
| Idea | Service |
|-------|----------|
| Custom domain mapping | Route 53 |
| HTTPS / SSL | CloudFront + ACM |
| Global caching & speed boost | CloudFront |
| Add monitoring & logging | CloudWatch |

---
