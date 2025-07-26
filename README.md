# IaC-EKS-Pipeline
Showcasing Infrastructure as Code Expertise and CI/CD Automation
# IaC EKS Pipeline

A modular, environment-driven Infrastructure-as-Code (IaC) pipeline using Terraform to provision and manage Amazon EKS clusters across multiple environments (dev, test, prod) with automated testing and change detection.

---

## 📌 Objective

- Provision and manage complex AWS resources (EKS)
- Support multiple environments
- Track infrastructure changes via Git versioning
- Automate testing and apply using CI/CD
- Detect breaking changes and enforce safety

---

## 🏗️ Project Structure

├── environments/
│ ├── dev/
│ ├── test/
│ └── prod/
├── modules/
│ └── eks/
├── tests/
│ └── eks_test.go
├── .github/
│ └── workflows/
├── backend.tf
