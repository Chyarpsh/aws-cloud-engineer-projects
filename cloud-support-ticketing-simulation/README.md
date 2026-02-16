# 🎫 Cloud Support Ticketing Simulation

A self-directed project demonstrating Cloud Support Engineer incident response workflows based on real AWS troubleshooting scenarios.

## 📋 Project Overview

This project simulates professional Cloud Support Engineer workflows through realistic incident documentation. Each ticket demonstrates systematic troubleshooting, root cause analysis, resolution, and preventative measures—skills essential for Cloud Support roles.

**Key Focus Areas:**
- Structured incident investigation methodology
- AWS service troubleshooting (networking, CDN, CI/CD)
- Professional documentation and communication
- Root cause analysis and problem prevention
- Customer-focused resolution strategies

## 🎯 Learning Objectives

- Practice real-world cloud incident handling
- Develop systematic troubleshooting skills
- Create professional incident documentation
- Understand Cloud Support Engineer daily workflows
- Build portfolio evidence of support capabilities

## 🔄 Ticket Workflow

Each ticket follows a standard Cloud Support incident workflow:

1. **Incident Report** - Problem identified by user or monitoring
2. **Initial Triage** - Severity assessment and prioritization
3. **Investigation** - Systematic troubleshooting and data collection
4. **Root Cause Analysis** - Identify underlying cause, not just symptoms
5. **Resolution** - Implement fix and verify functionality
6. **Preventative Actions** - Document learnings and prevent recurrence
7. **Documentation** - Clear communication for future reference

## 📝 Tickets Included

| Ticket ID | Title | Service | Priority | Root Cause | Status |
|-----------|-------|---------|----------|------------|--------|
| [CS-001](./tickets/CS-001-ec2-connectivity-issue.md) | EC2 instance unreachable after launch | EC2, VPC | High | Security group missing inbound rule | ✅ Resolved |
| [CS-002](./tickets/CS-002-cloudfront-failover.md) | CloudFront routed to secondary origin unexpectedly | CloudFront | Medium | Overly sensitive failover criteria | ✅ Resolved |
| [CS-003](./tickets/CS-003-ci-cd-deployment-failure.md) | CI/CD pipeline deployment failure | CodePipeline | High | Insufficient IAM permissions | ✅ Resolved |

### Ticket Coverage

**CS-001: EC2 Connectivity Issue**
- **Challenge:** Newly launched EC2 instance unreachable from client network
- **Skills:** VPC networking, security group configuration, route table analysis
- **Learning:** Network connectivity requires alignment of security groups, NACLs, routing, and subnet configuration

**CS-002: CloudFront Origin Failover**
- **Challenge:** Traffic routing to backup origin despite primary being healthy
- **Skills:** CloudFront origin groups, failover criteria, health checks, monitoring
- **Learning:** Failover thresholds must account for deployment-related temporary errors

**CS-003: CI/CD Deployment Failure**
- **Challenge:** Successful build but failed deployment in pipeline
- **Skills:** CI/CD debugging, IAM permission troubleshooting, pipeline log analysis
- **Learning:** Deployment roles require specific permissions beyond build permissions

## 🛠️ Technologies & Tools

**AWS Services:**
- **Compute & Networking:** EC2, VPC, Security Groups, Route Tables, NACLs
- **Content Delivery:** CloudFront, Origin Groups, Health Checks
- **CI/CD:** CodePipeline, CodeBuild, CodeDeploy
- **IAM:** Policies, Roles, Permission Troubleshooting
- **Monitoring:** CloudWatch, Logs, Metrics

**Troubleshooting Tools:**
- AWS Management Console
- CloudWatch Logs Insights
- VPC Flow Logs
- IAM Policy Simulator
- CloudWatch Dashboards

## 💡 Skills Demonstrated

### Technical Skills
- Systematic troubleshooting methodology (structured investigation)
- AWS networking debugging (VPC, security groups, routing)
- CDN configuration and failover logic
- CI/CD pipeline troubleshooting
- IAM permission analysis and resolution
- Log analysis and metric interpretation

### Professional Skills
- Clear incident documentation
- Customer communication (priority, status updates)
- Root cause analysis (not just quick fixes)
- Preventative thinking (avoid future issues)
- Professional ticket structure and formatting

## 🔗 Related Portfolio Projects

Each ticket references actual hands-on projects from my AWS portfolio:

- **CS-001** → [p2-lab06-testing-vpc-connectivity](../p2-lab06-testing-vpc-connectivity) - VPC connectivity testing and troubleshooting
- **CS-002** → [Advanced Cloud Architecture - CloudFront Failover](../Advanced%20Cloud%20Architecture%20%26%20Resilience%20Projects) - Multi-region HA with instant failover
- **CS-003** → [p6-lab05-continuous-integration-with-codebuild](../p6-lab05-continuous-integration-with-codebuild) & [p6-lab06-deploy-a-web-app-with-codedeploy](../p6-lab06-deploy-a-web-app-with-codedeploy) - CI/CD pipeline implementation

## 📄 Documentation

**View Individual Tickets:**
- [CS-001: EC2 Connectivity Issue](./tickets/CS-001-ec2-connectivity-issue.md)
- [CS-002: CloudFront Failover](./tickets/CS-002-cloudfront-failover.md)
- [CS-003: CI/CD Deployment Failure](./tickets/CS-003-ci-cd-deployment-failure.md)

**Download Complete Documentation:**
- [📥 Cloud Support Tickets (DOCX)](./Cloud_Support_Tickets.docx) - All tickets in formatted document

## 🎓 Why This Project Matters

Most entry-level cloud engineer candidates have:
- ❌ No support workflow experience
- ❌ No incident documentation examples
- ❌ No troubleshooting methodology demonstrated

This project shows:
- ✅ Understanding of Cloud Support Engineer role
- ✅ Systematic troubleshooting approach
- ✅ Professional documentation skills
- ✅ Real-world incident handling capability
- ✅ Customer-focused problem solving

## 🚀 Career Relevance

This simulation directly demonstrates skills required for:
- **Cloud Support Engineer** - Primary target role
- **Technical Support Engineer** - AWS/cloud focus
- **Cloud Operations Engineer** - Incident response
- **Site Reliability Engineer** - Troubleshooting focus

## 📌 Project Status

- **Created:** February 2026
- **Status:** Complete (3 tickets documented)
- **Next Steps:** Apply learnings to real support scenarios in professional role

---

**Note:** This is a self-directed portfolio project created to practice Cloud Support workflows. Scenarios are based on real AWS troubleshooting situations encountered during hands-on infrastructure projects.

**Portfolio:** [chyarpsh.github.io/Portfolio](https://chyarpsh.github.io/Portfolio/)  
**LinkedIn:** [linkedin.com/in/arpita-chowdhury-865a87203](https://www.linkedin.com/in/arpita-chowdhury-865a87203/)

