## 🎫 Ticket ID: CS-002
**Title:** CloudFront routed traffic to secondary origin unexpectedly  
**Priority:** Medium  
**Status:** Resolved  
**Service:** CloudFront  
**Reported By:** Monitoring System

---

### 🧠 Problem Summary
Traffic was routed to the secondary origin even though the primary service was available.

---

### 🔍 Investigation Steps
- Reviewed CloudFront origin group configuration
- Checked failover criteria
- Analyzed CloudWatch error metrics
- Reviewed application responses during deployment

---

### 🛠️ Root Cause
Failover criteria included temporary error responses generated during deployment.

---

### ✅ Resolution
- Refined failover criteria to exclude non-critical responses
- Retested failover and failback behavior

---

### 📌 Preventive Action
- Documented CloudFront failover best practices
- Added deployment-aware monitoring thresholds

---

### 🔗 Related Project
Instant Failover with CloudFront Origin Groups
