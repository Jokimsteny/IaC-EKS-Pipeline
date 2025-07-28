
# IaC EKS Pipeline

This project demonstrates an MVP infrastructure-as-code (IaC) pipeline to provision and manage an Amazon EKS cluster on AWS using Terraform. The pipeline supports multi-environment deployment, versioning, and automated testing.

---

## 🚀 Project Goals

- Provision complex AWS resources (EKS cluster)
- Use Terraform modules for reusable infrastructure
- Implement CI/CD pipeline via Gitlab CICD
- Track changes with versioning
- Mechanisms for Detecting Breaking Changes
- Promote configurations across environments (dev → test → prod)
- Include automated testing and breaking change detection

---

## 📁 Folder Structure

```
eks-iac-pipeline/
├── environments/        # Per-environment Terraform configs
│   ├── dev/
│   ├── test/
│   └── prod/
├── modules/# Reusable Terraform modules
│   └── eks/             # Terraform module for EKS VPC, IAM roles and policies, and  EKS cluster & node groups
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── README.md                   
├── terratest/           # Automated Go tests with Terratest framework
├── backend.tf           # Terraform backend configuration (S3 + DynamoDB)
├── .gitlab-ci.yml       # GitLab CI pipeline config
├── infracost       
│   └── infracost.yml    # Optional: Infracost config
│   └── infracost-usage.yml
├── terratest            # Automated Go tests with Terratest framework
│   └── eks_test.go      
└── README.md

---

## 🛠️ Setup Instructions

1. **Install Tools**:
    - Terraform ≥ 1.3
    - AWS CLI
    - Go (for testing)
    - GitHub CLI (optional for  automation)

2. **Configure AWS Credentials**:
```bash
export AWS_ACCESS_KEY_ID=your-access-key-id
export AWS_SECRET_ACCESS_KEY=your-secret-access-key
export AWS_DEFAULT_REGION=us-east-1
```

3. **Initialize Terraform**:
```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```



---

## 🔁 Promotion Guidelines

1. All changes must be tested in `dev` first.
2. Merge changes to `test` via  → Gitlab pipeline `terraform plan` and `apply`.
3. Repeat for `prod`.

```bash
# Example promotion process
git checkout test
git merge dev
git push origin test
```

---

## 🧪 Testing Infrastructure

We use [Terratest](https://terratest.gruntwork.io/) for testing infrastructure components.

```bash
cd terratest/
go test -v eks_test.go
```

Sample test:

```go
assert.Equal(t, "dev-cluster", clusterName)
```

---

## 🛑 Breaking Change Detection

- `terraform plan` generates diffs in MRs.
- Optional: Use `terraform-compliance` or `infracost` to block high-risk changes.
- Terraform breaking change detection in the plan stage
- terraform-compliance integration
- Infracost cost impact checks

---

## 🔖 Versioning

Modules are versioned using Git tags.

```hcl
source = "git::https://github.com/Jokimsteny/IaC-EKS-Pipeline.git/"
```


## Run Terratest locally (optional)
bash
Copy
Edit
cd terratest
go test -v eks_test.go
---


###   **CI/CD Setup**
<img width="700" height="800" alt="cicd-git" src="https://github.com/user-attachments/assets/6f72b2c3-35cc-40a8-8404-93d87ebf8f64" />

- Multi-stage CI/CD 
- Remote state backend   (S3 + DynamoDB)
- lint and format 
- Plan validation 
- Breaking change detection 
- Cost estimation  (Infracost)
- Policy compliance (terraform-compliance)
- Manual apply step 
- Git tagging/versioning


## 📎 Resources

- GitHub: https://github.com/Jokimsteny/IaC-EKS-Pipeline
- Documentation: ./README.md
- CI/CD: Gitlab CICD
- Test Framework: Terratest

---

## 👏 Authors

- Jokimsteny (DevOps Engineer / SRE)
- Contact: jokimsteny@gmail.com
