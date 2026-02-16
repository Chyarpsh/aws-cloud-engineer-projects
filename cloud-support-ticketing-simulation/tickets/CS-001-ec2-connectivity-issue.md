# 🎫 Ticket ID: CS-001

## EC2 Instance Unreachable After Launch

---

### 📊 Ticket Metadata

| Field | Value |
|-------|-------|
| **Title** | EC2 instance unreachable after launch |
| **Priority** | 🔴 High |
| **Status** | ✅ Resolved |
| **Service** | EC2, VPC |
| **Reported By** | Engineering Team |
| **Created** | 2026-02-01 10:15 AM |
| **Resolved** | 2026-02-01 11:20 AM |
| **Time to Resolve** | 1 hour 5 minutes |

---

## 🧠 Problem Summary

An EC2 instance (i-0abc123def456) was launched successfully in a public subnet but could not be accessed via SSH from the client network (203.0.113.0/24). The instance showed as "running" in the EC2 console, but connection attempts timed out.

**Customer Impact:**
- Development team blocked from deploying application
- Unable to configure instance or install required software
- No customer-facing service impact (development environment)

---

## 🔍 Investigation Steps

### Step 1: Verify Instance Status
```bash
aws ec2 describe-instances --instance-ids i-0abc123def456
```
**Finding:** Instance state = `running`, status checks = `2/2 passed`

### Step 2: Check Security Group Configuration
**Security Group:** sg-0123456789abcdef  
**Inbound Rules:**
- Port 80 (HTTP) - Source: 0.0.0.0/0 ✅
- Port 443 (HTTPS) - Source: 0.0.0.0/0 ✅

**Finding:** ❌ No rule allowing SSH (port 22) from client IP 203.0.113.0/24

### Step 3: Review Subnet Route Table
**Route Table:** rtb-0987654321fedcba  
**Routes:**
- 10.0.0.0/16 → local ✅
- 0.0.0.0/0 → igw-01234567 ✅

**Finding:** Routing configured correctly for public internet access

### Step 4: Inspect Network ACL Configuration
**Network ACL:** acl-0abcdef123456789  
**Inbound Rules:**
- Rule 100: ALL Traffic - Source: 0.0.0.0/0 - ALLOW ✅

**Outbound Rules:**
- Rule 100: ALL Traffic - Destination: 0.0.0.0/0 - ALLOW ✅

**Finding:** NACL not blocking traffic

### Step 5: Confirm Instance Placement
**Subnet:** subnet-0a1b2c3d4e5f6 (Public Subnet 1)  
**Availability Zone:** us-east-1a  
**Public IP:** 54.123.45.67 (assigned) ✅

**Finding:** Instance correctly placed in public subnet with public IP

---

## 🛠️ Root Cause

**Primary Issue:** Security group was missing an inbound rule to allow SSH access (port 22) from the client network.

**Contributing Factors:**
- Default security group only had HTTP/HTTPS rules
- Security group was not validated during instance launch
- No pre-launch connectivity testing checklist

**Why It Happened:**
Security group template was copied from web server configuration, which only needed HTTP/HTTPS. SSH access requirement was overlooked during launch preparation.

---

## ✅ Resolution

### Actions Taken

**1. Updated Security Group Rule**
```bash
aws ec2 authorize-security-group-ingress \
    --group-id sg-0123456789abcdef \
    --protocol tcp \
    --port 22 \
    --cidr 203.0.113.0/24
```

**2. Verified New Rule**
- Confirmed rule appeared in security group inbound rules
- Rule priority and CIDR block validated

**3. Tested Connectivity**
```bash
ssh -i keypair.pem ec2-user@54.123.45.67
```
**Result:** ✅ SSH connection successful

**4. Documented Configuration**
- Updated security group description
- Tagged security group with purpose: "Dev-SSH-Enabled"

### Verification Steps
- ✅ SSH connection from client IP successful
- ✅ HTTP/HTTPS access still functional
- ✅ Instance remained in running state
- ✅ No errors in system logs

---

## 📞 Customer Communication Timeline

| Time | Update |
|------|--------|
| 10:15 AM | Ticket received - acknowledged, investigating connectivity |
| 10:30 AM | Root cause identified - security group missing SSH rule |
| 10:45 AM | Fix implemented - testing connectivity |
| 11:00 AM | Resolution confirmed - instance accessible via SSH |
| 11:20 AM | Ticket closed - provided preventative checklist |

---

## 📌 Preventive Actions

### Immediate Actions
1. **Created VPC Launch Checklist:**
   - Verify security group includes required ports
   - Confirm route table associations
   - Validate NACL rules
   - Test connectivity post-launch

2. **Updated Security Group Template:**
   - Added SSH access as default for development instances
   - Created separate template for production (no SSH)

### Long-Term Improvements
1. **Automated Validation:**
   - Created script to verify required ports before launch
   - Added to CI/CD pipeline for infrastructure deployment

2. **Documentation:**
   - Documented common connectivity issues in team wiki
   - Created troubleshooting flowchart for EC2 access problems

3. **Training:**
   - Shared learnings with team in weekly meeting
   - Added to onboarding checklist for new team members

---

## 🔗 Related Resources

**AWS Documentation:**
- [Security Groups for Your VPC](https://docs.aws.amazon.com/vpc/latest/userguide/security-groups.html)
- [Troubleshoot Connecting to Your Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html)

**Related Portfolio Projects:**
- [p2-lab02-build-a-virtual-private-cloud](../../p2-lab02-build-a-virtual-private-cloud)
- [p2-lab03-vpc-traffic-flow-and-security](../../p2-lab03-vpc-traffic-flow-and-security)
- [p2-lab06-testing-vpc-connectivity](../../p2-lab06-testing-vpc-connectivity)

**Tools Used:**
- AWS CLI for verification and remediation
- EC2 Console for instance monitoring
- VPC Console for network configuration review

---

## 📚 Lessons Learned

### Technical Lessons
1. **Security group rules are stateful** : inbound rules automatically allow response traffic
2. **Multiple layers affect connectivity** : must verify SG, NACL, routing, and IGW
3. **Default deny principle** : AWS security groups deny all traffic by default

### Process Lessons
1. **Pre-launch validation saves time** : spending 5 minutes on checklist prevents 1+ hour incidents
2. **Template reuse requires customization** : copying configurations needs verification
3. **Documentation prevents recurrence** : clear runbooks help entire team

### Support Skills
1. **Systematic investigation** : check each layer methodically rather than randomly
2. **Clear communication** : keep customer updated on progress and timeline
3. **Think prevention** : fixing the issue isn't enough; prevent it from happening again

---

## 🏷️ Tags

`ec2` `vpc` `networking` `security-groups` `connectivity` `troubleshooting` `incident-response` `cloud-support`

---

**Status:** Resolved ✅  
**Next Steps:** None required preventative measures implemented  
**Follow-up:** Monitor for similar issues over next 30 days
