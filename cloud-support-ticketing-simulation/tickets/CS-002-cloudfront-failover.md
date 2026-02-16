# 🎫 Ticket ID: CS-002

## CloudFront Routed Traffic to Secondary Origin Unexpectedly

---

### 📊 Ticket Metadata

| Field | Value |
|-------|-------|
| **Title** | CloudFront routed traffic to secondary origin unexpectedly |
| **Priority** | 🟡 Medium |
| **Status** | ✅ Resolved |
| **Service** | CloudFront |
| **Reported By** | Monitoring System (CloudWatch Alarm) |
| **Created** | 2026-02-03 14:30 PM |
| **Resolved** | 2026-02-03 16:15 PM |
| **Time to Resolve** | 1 hour 45 minutes |

---

## 🧠 Problem Summary

A CloudFront distribution (E2QWRTYUIOPASDF) configured with origin groups unexpectedly failed over to the secondary S3 origin despite the primary Application Load Balancer being healthy and operational. This occurred during a routine application deployment.

**Customer Impact:**
- ~15% of requests served from backup S3 static content instead of primary ALB
- Duration: 45 minutes
- No customer-facing errors (both origins served valid content)
- Slight increase in response time for dynamic content requests

**Business Context:**
- Primary origin (ALB): Dynamic application content
- Secondary origin (S3): Cached static fallback content
- Failover designed for true primary outages only

---

## 🔍 Investigation Steps

### Step 1: Review CloudFront Distribution Configuration
**Distribution ID:** E2QWRTYUIOPASDF  
**Origin Group:** OG-primary-alb-secondary-s3

**Configuration:**
```
Primary Origin: ALB (app-lb-1234567890.us-east-1.elb.amazonaws.com)
Secondary Origin: S3 (backup-content.s3.amazonaws.com)
Failover Criteria: 
  - HTTP 500 (Internal Server Error)
  - HTTP 502 (Bad Gateway)
  - HTTP 503 (Service Unavailable)
  - HTTP 504 (Gateway Timeout)
```

**Finding:** Failover configured to trigger on 5xx errors

### Step 2: Check CloudWatch Metrics
**Metric:** Origin 4xx/5xx Error Rates  
**Timeframe:** 14:00 - 15:00

**Observations:**
- 14:05-14:08: Spike in 503 errors from primary ALB (12 errors over 3 minutes)
- 14:09-14:50: Traffic routing shifted to secondary S3 origin
- 14:51: Traffic returned to primary ALB

**Finding:** 503 errors during deployment triggered failover

### Step 3: Analyze Application Deployment Timeline
**Deployment Window:** 14:00 - 14:15  
**Deployment Type:** Rolling update with health checks

**Events:**
- 14:05: First instance taken out of rotation for update
- 14:05-14:08: Temporary capacity reduction caused brief 503 responses
- 14:15: All instances updated and healthy
- **Finding:** Deployment caused temporary 503 errors, which triggered CloudFront failover

### Step 4: Review ALB Target Group Health
**Target Group:** app-tg-production  
**Health Check:** HTTP /health on port 80

**Health Status During Incident:**
- 14:05-14:08: 2 out of 4 targets healthy (rolling deployment)
- 14:09 onward: 4 out of 4 targets healthy
- **Finding:** ALB was functioning correctly but with reduced capacity

### Step 5: Examine CloudFront Failover Logs
**Access Logs Analysis:**
```bash
# Parsed CloudFront access logs for origin switching
grep "x-edge-result-type" logs/*.gz | grep -E "(Miss|Origin)"
```

**Finding:** 
- Failover triggered at 14:09 (after 503 threshold met)
- Failback occurred at 14:51 (after 10-minute health stabilization period)
- Delay between ALB recovery (14:15) and failback (14:51) = 36 minutes

---

## 🛠️ Root Cause

**Primary Issue:** CloudFront origin group failover criteria included HTTP 503 errors, which are normal during rolling deployments and should not trigger failover to backup content.

**Why It Happened:**
1. **Overly sensitive failover criteria** - 503 is valid during planned deployments
2. **No deployment-aware monitoring** - CloudFront couldn't distinguish between outage and deployment
3. **Delayed failback** - CloudFront's conservative health check period kept traffic on secondary origin

**Technical Details:**
- Rolling deployments temporarily reduce capacity
- Reduced capacity can cause 503 responses under normal load
- These 503s don't indicate true origin failure
- CloudFront treated deployment-related 503s the same as outage-related 503s

---

## ✅ Resolution

### Actions Taken

**1. Updated Origin Group Failover Criteria**

**Before:**
```
Failover on: 500, 502, 503, 504
```

**After:**
```
Failover on: 500, 502, 504
Excluded: 503 (Service Unavailable)
```

**Rationale:** 503 is common during deployments and capacity scaling; doesn't indicate origin failure

**2. Adjusted Failover Threshold**
```
Before: 1 failure triggers failover
After: 3 consecutive failures within 30 seconds triggers failover
```

**Rationale:** Reduces sensitivity to transient deployment-related errors

**3. Updated Deployment Process**
**New Pre-Deployment Steps:**
- Set CloudWatch alarm to "in maintenance" mode during deployment window
- Increase target group health check interval during rolling updates
- Monitor CloudFront origin switching in real-time

**4. Tested Failover Behavior**

**Test Scenario 1: Simulated Rolling Deployment**
- Gradually reduced ALB capacity
- Result: ✅ No unintended failover

**Test Scenario 2: True Origin Failure**
- Stopped all ALB targets
- Result: ✅ Proper failover to S3 backup within 60 seconds

**Test Scenario 3: Failback Timing**
- Restored ALB targets after failure
- Result: ✅ Failback within 5 minutes (improved from 36 minutes)

---

## 📞 Customer Communication Timeline

| Time | Update |
|------|--------|
| 14:30 PM | Alert received - investigating unexpected origin switching |
| 14:45 PM | Root cause identified - deployment-triggered failover |
| 15:15 PM | Failover criteria updated - testing new configuration |
| 15:45 PM | Testing complete - all scenarios validated |
| 16:00 PM | Documentation updated - deployment runbook modified |
| 16:15 PM | Ticket closed - preventative measures implemented |

---

## 📌 Preventive Actions

### Immediate Actions

1. **Created Deployment-Aware Monitoring:**
   - CloudWatch dashboard showing CloudFront origin distribution
   - Alarm for unexpected secondary origin usage outside deployment windows
   - SNS notification for origin switching events

2. **Updated Failover Configuration:**
   - Excluded 503 from automatic failover criteria
   - Implemented threshold-based failover (3 consecutive errors)
   - Reduced failback delay from 10 minutes to 3 minutes

3. **Documented CloudFront Failover Best Practices:**
   ```
   ✅ DO trigger failover on: True origin failures (500, 502, 504)
   ❌ DON'T trigger failover on: Deployment-related capacity reductions (503)
   ✅ DO use thresholds: Multiple consecutive failures
   ❌ DON'T use single failure: Too sensitive to transient issues
   ```

### Long-Term Improvements

1. **Deployment Automation:**
   - Created Lambda function to temporarily adjust CloudFront failover during deployments
   - Automatically restores settings post-deployment
   - Integrated with CI/CD pipeline

2. **Enhanced Monitoring:**
   - Real-time dashboard for origin health and traffic distribution
   - Baseline metrics for normal deployment behavior
   - Anomaly detection for unexpected origin switching

3. **Runbook Updates:**
   - Added "Deployment Checklist" including CloudFront considerations
   - Created troubleshooting guide for origin failover scenarios
   - Documented expected vs. unexpected failover triggers

---

## 🔗 Related Resources

**AWS Documentation:**
- [Using CloudFront Origin Groups](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/high_availability_origin_failover.html)
- [CloudFront Origin Failover](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/origin-groups.html)
- [Optimizing Caching and Availability](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/ConfiguringCaching.html)

**Related Portfolio Projects:**
- [Advanced Cloud Architecture - CloudFront Instant Failover](../../Advanced%20Cloud%20Architecture%20%26%20Resilience%20Projects)
- [p2-lab11-website-delivery-with-cloudfront](../../p2-lab11-website-delivery-with-cloudfront)
- [Multi-Region Application on AWS](../../Advanced%20Cloud%20Architecture%20%26%20Resilience%20Projects)

**Tools Used:**
- CloudFront Console (distribution configuration)
- CloudWatch (metrics and logs analysis)
- AWS CLI (log parsing and analysis)
- Access logs (origin switching investigation)

---

## 📚 Lessons Learned

### Technical Lessons

1. **Failover criteria must match use case** - Not all 5xx errors indicate true failures
2. **Deployments create transient errors** - Normal operational events shouldn't trigger disaster recovery
3. **Thresholds prevent false positives** - Single error isn't enough to determine failure
4. **Failback timing matters** - Conservative checks can extend unnecessary failover duration

### Process Lessons

1. **Monitor during deployments** - Real-time visibility prevents surprises
2. **Test failover in realistic scenarios** - Include deployment simulations, not just outages
3. **Document expected behavior** - Team needs to know what's normal during deployments

### Support Skills

1. **Distinguish symptoms from root cause** - "Origin switched" is symptom, "oversensitive criteria" is cause
2. **Consider operational context** - Deployment window explains error timing
3. **Balance safety and sensitivity** - Failover should protect but not trigger unnecessarily

---

## 📊 Impact Analysis

### Before Resolution
- **False positive failovers:** ~3 per week during deployments
- **Average failback delay:** 35-40 minutes
- **Customer confusion:** "Why is cached content showing during deployments?"

### After Resolution
- **False positive failovers:** 0 in last 30 days
- **True positive failovers:** 1 (tested), worked correctly
- **Average failback delay:** 3-5 minutes
- **Deployment confidence:** Increased (no unexpected behavior)

---

## 🏷️ Tags

`cloudfront` `cdn` `origin-failover` `high-availability` `monitoring` `deployments` `troubleshooting` `cloud-support`

---

**Status:** Resolved ✅  
**Next Steps:** Monitor deployment-period behavior for 30 days  
**Follow-up:** Review metrics monthly to validate configuration effectiveness
