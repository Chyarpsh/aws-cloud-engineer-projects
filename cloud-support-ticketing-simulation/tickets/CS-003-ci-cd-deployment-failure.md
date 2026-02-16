# 🎫 Ticket ID: CS-003

## Application Deployment Failed During CI/CD Pipeline Execution

---

### 📊 Ticket Metadata

| Field | Value |
|-------|-------|
| **Title** | Application deployment failed during CI/CD pipeline execution |
| **Priority** | 🔴 High |
| **Status** | ✅ Resolved |
| **Service** | CodePipeline, CodeBuild, CodeDeploy, IAM |
| **Reported By** | DevOps Team |
| **Created** | 2026-02-05 09:45 AM |
| **Resolved** | 2026-02-05 11:30 AM |
| **Time to Resolve** | 1 hour 45 minutes |

---

## 🧠 Problem Summary

A CI/CD pipeline (app-deployment-pipeline-prod) failed during the deployment stage after successfully completing the build stage. The error occurred when CodeDeploy attempted to deploy the application to EC2 instances via Auto Scaling group.

**Error Message:**
```
AccessDeniedException: User: arn:aws:sts::123456789012:assumed-role/
CodeDeployServiceRole/AWSCodeDeploy is not authorized to perform: 
ec2:CreateTags on resource: arn:aws:ec2:us-east-1:123456789012:instance/*
```

**Customer Impact:**
- Production deployment blocked (critical hotfix pending)
- Rollback to previous version required
- Development team unable to ship critical bug fix
- Customer impact: Known bug remained in production for 1.5 hours

---

## 🔍 Investigation Steps

### Step 1: Review Pipeline Execution History
**Pipeline:** app-deployment-pipeline-prod  
**Execution ID:** 12345678-abcd-1234-efgh-567890abcdef

**Stage Results:**
```
✅ Source Stage (GitHub) - Succeeded
✅ Build Stage (CodeBuild) - Succeeded  
   - Build time: 4m 32s
   - Artifacts uploaded to S3: success
❌ Deploy Stage (CodeDeploy) - Failed
   - Error: AccessDeniedException
   - Failed at: EC2 instance tagging operation
```

**Finding:** Build succeeded, deployment failed on IAM permission issue

### Step 2: Examine CodeBuild Logs
**Build Project:** app-builder-prod  
**Log Group:** /aws/codebuild/app-builder-prod

**Relevant Log Entries:**
```
[Container] 2026/02/05 09:50:12 Phase INSTALL
[Container] 2026/02/05 09:50:25 Phase PRE_BUILD
[Container] 2026/02/05 09:51:43 Phase BUILD
[Container] 2026/02/05 09:53:15 Phase POST_BUILD
[Container] 2026/02/05 09:54:47 Build complete
[Container] 2026/02/05 09:54:50 Uploading artifacts to S3
[Container] 2026/02/05 09:54:52 Artifacts uploaded successfully
```

**Finding:** Build stage completed successfully with no errors

### Step 3: Analyze CodeDeploy Deployment Logs
**Deployment Group:** app-prod-deployment-group  
**Deployment ID:** d-1A2B3C4D5E

**Deployment Events:**
```
09:55:00 - Deployment started
09:55:15 - Creating deployment lifecycle event hooks
09:55:30 - Attempting to tag EC2 instances for deployment tracking
09:55:31 - ERROR: AccessDeniedException - ec2:CreateTags
09:55:32 - Deployment failed
```

**Finding:** Failure occurred when CodeDeploy tried to tag instances

### Step 4: Review IAM Role Permissions
**Service Role:** CodeDeployServiceRole  
**Role ARN:** arn:aws:iam::123456789012:role/CodeDeployServiceRole

**Attached Policies:**
```bash
aws iam list-attached-role-policies --role-name CodeDeployServiceRole
```

**Current Policies:**
- AWSCodeDeployRole (AWS managed) ✅
- Custom-S3-Access-Policy ✅

**Checked Policy Details:**
```bash
aws iam get-policy-version --policy-arn arn:aws:iam::aws:policy/AWSCodeDeployRole --version-id v1
```

**AWS Managed Policy Actions:**
- ✅ ec2:Describe* (Read-only EC2 access)
- ✅ autoscaling:* (Auto Scaling operations)
- ✅ s3:Get*, s3:List* (S3 artifact access)
- ❌ ec2:CreateTags (NOT included)

**Finding:** Service role missing `ec2:CreateTags` permission

### Step 5: Verify IAM Policy Simulator
**Testing Permission:**
```bash
aws iam simulate-principal-policy \
    --policy-source-arn arn:aws:iam::123456789012:role/CodeDeployServiceRole \
    --action-names ec2:CreateTags \
    --resource-arns arn:aws:ec2:us-east-1:123456789012:instance/*
```

**Result:** `DENY` (implicitly denied - permission not granted)

**Finding:** Confirmed - role lacks required permission

---

## 🛠️ Root Cause

**Primary Issue:** The CodeDeploy service role (`CodeDeployServiceRole`) lacked the `ec2:CreateTags` permission required to tag EC2 instances during deployment tracking.

**Why It Happened:**
1. **Recent CodeDeploy feature update** - AWS added instance tagging for deployment tracking
2. **Older IAM role** - Role created before tagging feature was introduced
3. **AWS managed policy not updated automatically** - AWSCodeDeployRole policy doesn't auto-update on accounts
4. **No permission validation** - Pipeline didn't test permissions before attempting deployment

**Timeline:**
- Role created: 6 months ago with older permissions
- AWS feature update: Added deployment tagging 3 months ago
- Previous deployments: Worked because tagging wasn't required
- Recent CodeDeploy update: Made tagging mandatory → exposed permission gap

---

## ✅ Resolution

### Actions Taken

**1. Created Custom IAM Policy for Missing Permissions**

**Policy Name:** CodeDeploy-EC2-Tagging-Policy  
**Policy Document:**
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:CreateTags",
        "ec2:DeleteTags"
      ],
      "Resource": "arn:aws:ec2:*:123456789012:instance/*",
      "Condition": {
        "StringEquals": {
          "ec2:ResourceTag/DeploymentGroup": "app-prod-deployment-group"
        }
      }
    }
  ]
}
```

**Least Privilege Applied:**
- Limited to EC2 instances only (not all resources)
- Condition restricts to instances in specific deployment group
- Scoped to account 123456789012

**2. Attached Policy to Service Role**
```bash
aws iam attach-role-policy \
    --role-name CodeDeployServiceRole \
    --policy-arn arn:aws:iam::123456789012:policy/CodeDeploy-EC2-Tagging-Policy
```

**3. Verified Updated Permissions**
```bash
# List all attached policies
aws iam list-attached-role-policies --role-name CodeDeployServiceRole

# Simulate permission again
aws iam simulate-principal-policy \
    --policy-source-arn arn:aws:iam::123456789012:role/CodeDeployServiceRole \
    --action-names ec2:CreateTags \
    --resource-arns arn:aws:ec2:us-east-1:123456789012:instance/*
```

**Result:** `ALLOW` ✅

**4. Triggered New Pipeline Execution**
```bash
aws codepipeline start-pipeline-execution \
    --name app-deployment-pipeline-prod
```

**Execution Results:**
```
✅ Source Stage - Succeeded (1m 15s)
✅ Build Stage - Succeeded (4m 30s)
✅ Deploy Stage - Succeeded (8m 45s)
```

**Total Pipeline Time:** 14 minutes 30 seconds

**5. Validated Deployment**
- ✅ Application deployed to all instances in Auto Scaling group
- ✅ Health checks passed
- ✅ EC2 instances properly tagged with deployment metadata
- ✅ Critical hotfix live in production

---

## 📞 Customer Communication Timeline

| Time | Update |
|------|--------|
| 09:45 AM | Deployment failure reported - investigating pipeline logs |
| 10:00 AM | Root cause identified - IAM permission issue with CodeDeploy role |
| 10:15 AM | Creating custom IAM policy with required permissions |
| 10:30 AM | Policy attached to service role - testing permissions |
| 10:45 AM | Retriggering pipeline execution |
| 11:00 AM | Deployment in progress - monitoring stages |
| 11:15 AM | Deployment successful - critical hotfix deployed |
| 11:30 AM | Ticket closed - documented resolution and prevention steps |

---

## 📌 Preventive Actions

### Immediate Actions

1. **Created IAM Permission Validation Script**
```bash
#!/bin/bash
# validate-codedeploy-permissions.sh

ROLE_NAME="CodeDeployServiceRole"
REQUIRED_ACTIONS=(
    "ec2:CreateTags"
    "ec2:DescribeInstances"
    "autoscaling:PutLifecycleHook"
    "s3:GetObject"
)

for ACTION in "${REQUIRED_ACTIONS[@]}"; do
    RESULT=$(aws iam simulate-principal-policy \
        --policy-source-arn arn:aws:iam::123456789012:role/$ROLE_NAME \
        --action-names $ACTION \
        --query 'EvaluationResults[0].EvalDecision' \
        --output text)
    
    if [ "$RESULT" != "allowed" ]; then
        echo "❌ MISSING: $ACTION"
    else
        echo "✅ OK: $ACTION"
    fi
done
```

**Integrated into:** Pre-deployment checklist and CI/CD pipeline

2. **Updated All CodeDeploy Service Roles**
- Applied policy to development pipeline role
- Applied policy to staging pipeline role
- Applied policy to production pipeline role
- Verified permissions across all environments

3. **Added Permission Monitoring**
```yaml
# CloudWatch alarm for IAM permission denials
AccessDeniedAlarm:
  Type: AWS::CloudWatch::Alarm
  Properties:
    AlarmName: CodeDeploy-Permission-Denied
    MetricName: AccessDenied
    Namespace: AWS/CodeDeploy
    Statistic: Sum
    Period: 300
    EvaluationPeriods: 1
    Threshold: 1
    ComparisonOperator: GreaterThanThreshold
    AlarmActions:
      - !Ref DevOpsTeamSNSTopic
```

### Long-Term Improvements

1. **Pipeline Permission Testing:**
   - Added pre-deployment permission validation stage
   - Tests all required IAM actions before actual deployment
   - Fails fast if permissions are missing

2. **Infrastructure as Code:**
   - Migrated IAM role creation to CloudFormation
   - Included all required permissions in template
   - Version-controlled IAM policies alongside pipeline code

3. **Documentation Updates:**
   - Created "CodeDeploy IAM Requirements" runbook
   - Listed all required permissions for different deployment scenarios
   - Added troubleshooting guide for permission errors

4. **Automated Policy Updates:**
   - Created Lambda function to check AWS service updates
   - Compares current role permissions against AWS recommendations
   - Sends alerts when gaps detected

---

## 🔗 Related Resources

**AWS Documentation:**
- [AWS CodeDeploy IAM Role Requirements](https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-service-role.html)
- [IAM Policy Simulator](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_testing-policies.html)
- [Troubleshooting CodeDeploy](https://docs.aws.amazon.com/codedeploy/latest/userguide/troubleshooting.html)

**Related Portfolio Projects:**
- [p6-lab05-continuous-integration-with-codebuild](../../p6-lab05-continuous-integration-with-codebuild)
- [p6-lab06-deploy-a-web-app-with-codedeploy](../../p6-lab06-deploy-a-web-app-with-codedeploy)
- [p6-lab08-build-a-ci-cd-pipeline-with-aws](../../p6-lab08-build-a-ci-cd-pipeline-with-aws)
- [p4-lab02-cloud-security-with-aws-iam](../../p4-lab02-cloud-security-with-aws-iam)

**Tools Used:**
- AWS CLI (IAM policy simulation and management)
- CodePipeline Console (execution monitoring)
- CloudWatch Logs (build and deployment log analysis)
- IAM Policy Simulator (permission testing)

---

## 📚 Lessons Learned

### Technical Lessons

1. **IAM permissions evolve** - AWS services add new features requiring new permissions
2. **Managed policies don't auto-update** - Existing roles need manual permission updates
3. **Least privilege is essential** - Scope permissions to specific resources and conditions
4. **Test permissions before deployment** - Simulation prevents production failures

### Process Lessons

1. **Validate assumptions** - "It worked before" doesn't mean permissions are complete
2. **Monitor AWS service updates** - New features may require permission adjustments
3. **Document IAM requirements** - Clear documentation prevents future issues
4. **Fail fast with validation** - Catching permission errors early saves time

### Support Skills

1. **Read error messages carefully** - "AccessDeniedException" points directly to IAM
2. **Use AWS tools effectively** - IAM Policy Simulator confirmed root cause quickly
3. **Apply least privilege** - Fixed the problem without over-permissioning
4. **Think prevention** - Permission validation prevents recurrence

---

## 📊 Impact Analysis

### Deployment Metrics

**Before Resolution:**
- Deployment success rate: 85% (IAM errors causing 15% failures)
- Average troubleshooting time: 1-2 hours per IAM issue
- Manual permission fixes: 2-3 per month

**After Resolution:**
- Deployment success rate: 99% (only true errors fail)
- Average troubleshooting time: <15 minutes (automated validation)
- Manual permission fixes: 0 (validation catches issues)

### Business Impact

- **Production downtime:** Avoided future 1+ hour incidents
- **Developer productivity:** Eliminated 2-3 hours/month of troubleshooting
- **Deployment confidence:** Team trusts pipeline to catch issues early

---

## 🏷️ Tags

`codepipeline` `codedeploy` `codebuild` `iam` `ci-cd` `permissions` `troubleshooting` `automation` `cloud-support`

---

**Status:** Resolved ✅  
**Next Steps:** Monitor pipeline executions for 30 days to validate fix  
**Follow-up:** Review IAM permissions quarterly for AWS service updates
