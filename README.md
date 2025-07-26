
# IaC EKS Pipeline

This project demonstrates an MVP infrastructure-as-code (IaC) pipeline to provision and manage an Amazon EKS cluster on AWS using Terraform. The pipeline supports multi-environment deployment, versioning, and automated testing.

---

## 🚀 Project Goals

- Provision complex AWS resources (EKS cluster)
- Use Terraform modules for reusable infrastructure
- Implement CI/CD pipeline via GitHub Actions
- Track changes with versioning
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
├── iam/                 # IAM roles and policies for EKS cluster & nodes
├── modules/eks/         # Terraform module for EKS cluster & node groups
├── terratest/           # Automated Go tests with Terratest framework
├── backend.tf           # Terraform backend configuration (S3 + DynamoDB)
├── GitlabCICID          # GitLab CI pipeline config
│   └── .gitlab-ci.yml   
├── terratest            # Automated Go tests with Terratest framework
   └── eks_test.go      
└── README.md

---

## 🛠️ Setup Instructions

1. **Install Tools**:
    - Terraform ≥ 1.3
    - AWS CLI
    - Go (for testing)
    - GitHub CLI (optional for PR automation)

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

4. **CI/CD Setup**:
   - GitHub Actions automatically runs on push to `main` for all environments.

---

## 🔁 Promotion Guidelines

1. All changes must be tested in `dev` first.
2. Merge changes to `test` via PR → GitHub Actions triggers `terraform plan` and `apply`.
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
cd tests/
go test -v eks_test.go
```

Sample test:

```go
assert.Equal(t, "dev-cluster", clusterName)
```

---

## 🛑 Breaking Change Detection

- `terraform plan` generates diffs in PRs.
- Optional: Use `terraform-compliance` or `infracost` to block high-risk changes.

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

## 📎 Resources

- GitHub: https://github.com/Jokimsteny/IaC-EKS-Pipeline
- Documentation: ./README.md
- CI/CD: GitHub Actions Workflow
- Test Framework: Terratest

---

## 👏 Authors

- Jokimsteny (DevOps Engineer / SRE)
- Contact: jokimsteny@gmail.com
