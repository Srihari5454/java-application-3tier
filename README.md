🚀 Deploy Java Application on AWS using 3-Tier Architecture (Terraform)

📌 Project Overview

This project demonstrates the deployment of a production-grade Java web application on AWS using a 3-tier architecture, fully automated with Terraform.

The architecture follows cloud-native and enterprise best practices, ensuring: - High Availability (Multi-AZ) - Scalability (Auto Scaling) - Security (network isolation & defense-in-depth) - Infrastructure as Code (IaC)

The Java application used is a Login Application, automatically cloned and deployed on Apache Tomcat instances during EC2 boot.

🧱 Architecture Overview

🔹 3-Tier Design
Tier	Technology	Purpose
Presentation Tier	Nginx + Public Network Load Balancer + CloudFront	Handles user traffic
Application Tier	Apache Tomcat (Auto Scaling Group) + Internal NLB	Runs Java application
Data Tier	Amazon RDS MySQL (Multi-AZ) + ElastiCache Redis	Persistent & session data

🔹 Network Design
Two VPCs
Application VPC: 172.32.0.0/16
Shared (Database) VPC: 192.168.0.0/16
Public & Private Subnets across 2 AZs
Transit Gateway for secure inter-VPC communication
🛠️ Technology Stack
Cloud Provider: AWS
Infrastructure as Code: Terraform
Frontend: Nginx
Backend: Java + Apache Tomcat
Database: Amazon RDS (MySQL, Multi-AZ)
Cache: Amazon ElastiCache (Redis)
Load Balancing: Network Load Balancer (Public & Internal)
CDN: Amazon CloudFront
Auto Scaling: EC2 Auto Scaling Groups

📁 Project Structure

aws-3tier-enterprise/

│

├── provider.tf

├── variables.tf

├── terraform.tfvars

│

├── vpc_app.tf

├── vpc_shared.tf

├── igw_and_routes.tf

├── transit_gateway.tf
│

├── security_groups.tf

│

├── nginx_asg.tf

├── tomcat_asg.tf

│

├── nlb_public.tf

├── nlb_internal.tf

│

├── rds.tf

├── elasticache.tf

├── cloudfront.tf

│

├── outputs.tf

⚙️ Prerequisites
Before starting, ensure you have:

AWS Account
IAM user with AdministratorAccess
AWS CLI installed & configured
Terraform v1.5+
Git
Verify:

aws --version
terraform --version
git --version

🔐 Credentials Handling (Best Practice)
AWS Credentials: Configured using aws configure
Database Credentials: Stored in terraform.tfvars
terraform.tfvars is NOT committed to GitHub
Example:

db_username = "appuser"
db_password = "StrongPassword123!"

🚀 Deployment Steps
1️⃣ Initialize Terraform
terraform init
2️⃣ Validate Configuration
terraform validate
3️⃣ Review Execution Plan
terraform plan
4️⃣ Apply Infrastructure
terraform apply
Type yes when prompted.

🔄 What Happens During Deployment
VPCs and subnets are created
Internet Gateway & routing configured
Transit Gateway connects both VPCs
Security Groups enforce tier-level access
Auto Scaling Groups launch EC2 instances
Java application is automatically cloned from GitHub using user_data
Tomcat builds and deploys the WAR file
NLBs route traffic
RDS & Redis are provisioned
CloudFront exposes a global endpoint

🌐 Accessing the Application
After deployment:

terraform output
Open the CloudFront URL in your browser:

https://<cloudfront-domain>
You should see the Java Login application.

✅ Success Criteria Verification

Requirement	Status
Public URL accessible	✅
Auto Scaling working	✅
Database connectivity	✅
Monitoring ready	✅
Secure networking	✅

🧪 Validation Checklist
EC2 instances running (Nginx & Tomcat)
Auto Scaling Groups show InService
Load Balancers are Active
RDS status is Available
Redis cluster is Available

🧠 Interview Talking Points
You can confidently explain:

“I deployed a production-grade Java application on AWS using a secure 3-tier architecture, automated fully with Terraform, including multi-VPC design, Transit Gateway, Auto Scaling, Network Load Balancers, RDS Multi-AZ, ElastiCache, and CloudFront.”

📈 Future Enhancements
Add CloudWatch alarms & dashboards
HTTPS using ACM certificates
CI/CD pipeline (GitHub Actions)
Terraform modules refactor
Secrets Manager for DB credentials
🧹 Cleanup
To destroy all resources:

terraform destroy

👤 Author

Srihari

DevOps | Cloud | Java Backend
