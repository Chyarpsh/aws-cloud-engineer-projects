## 🎫 Ticket ID: CS-001
**Title:** EC2 instance unreachable after launch  
**Priority:** High  
**Status:** Resolved  
**Service:** EC2 / VPC  
**Reported By:** Engineering Team

---

### 🧠 Problem Summary
An EC2 instance launched successfully but could not be accessed from the client network.

---

### 🔍 Investigation Steps
- Verified EC2 instance was running
- Checked security group inbound rules
- Reviewed subnet route table
- Inspected network ACL configuration
- Confirmed instance placement in a public subnet

---

### 🛠️ Root Cause
Security group and routing configuration did not allow inbound traffic from the client IP.

---

### ✅ Resolution
- Updated security group to allow required inbound access
- Corrected route table association
- Verified connectivity after changes

---

### 📌 Preventive Action
- Created a baseline VPC configuration checklist
- Validated connectivity during provisioning

---

### 🔗 Related Project
p2-lab06-testing-vpc-connectivity
