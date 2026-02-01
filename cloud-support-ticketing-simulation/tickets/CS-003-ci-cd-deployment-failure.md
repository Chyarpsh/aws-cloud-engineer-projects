## 🎫 Ticket ID: CS-003
**Title:** Application deployment failed during CI/CD pipeline execution  
**Priority:** High  
**Status:** Resolved  
**Service:** CodePipeline / CodeBuild  
**Reported By:** DevOps Team

---

### 🧠 Problem Summary
The CI/CD pipeline failed during the deployment stage after a successful build.

---

### 🔍 Investigation Steps
- Reviewed pipeline execution logs
- Analyzed build artifacts
- Checked deployment stage logs
- Verified IAM role permissions

---

### 🛠️ Root Cause
Deployment role did not have sufficient permissions to access required resources.

---

### ✅ Resolution
- Updated IAM policy to allow necessary access
- Re-ran pipeline successfully

---

### 📌 Preventive Action
- Reviewed IAM permissions for CI/CD roles
- Added permission validation to pipeline setup

---

### 🔗 Related Project
p6-lab05-continuous-integration-with-codebuild  
p6-lab06-deploy-a-web-app-with-codedeploy
