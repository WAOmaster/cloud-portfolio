# Sashi Perera — Cloud Architecture Portfolio

![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin&logoColor=white) [LinkedIn](https://www.linkedin.com/in/sashiperera/)  
![Credly](https://img.shields.io/badge/Credly-Badges-4c1?logo=credly&logoColor=white) [Credly](https://www.credly.com/users/sashi-perera.35c7414d/badges#credly)

---
## Overview

This repository is a compact, high-signal portfolio showcasing practical cloud architecture work you can demo to hiring managers, recruiters, and technical leads.

**Why this matters:** recruiters don't care about degrees — they care about outcomes. This repo proves you can design secure landing zones, run multi-cloud demos, and deploy GenAI proof-of-concepts with production-aware controls.

**What's included**
- `landing-zone/` — Modular Terraform skeleton for a GCP landing zone (VPC, IAM, logging/monitoring). Designed for repeatable, secure environment provisioning.
- `multi-cloud-demo/` — Tiny Flask app + Dockerfile + Kubernetes manifest to demonstrate deployment to multiple clouds (GKE / OKE).
- `genai-poc/` — Lightweight GenAI inference PoC (mocked endpoint) with deployment notes for safe, cost-aware operation.
- `cloudbuild.yaml` — Example Cloud Build pipeline (build, push, deploy).
- `portfolio-readme.md` — One‑page summary ideal for GitHub Featured or LinkedIn posts.

---
## Quickstart (what recruiters want to see fast)

1. **Clone**
```bash
git clone <your-github-repo-url>
cd sashi-cloud-portfolio
```

2. **Showcase (local demo)**
- Run the multi-cloud demo app locally:
```bash
# from multi-cloud-demo/app
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python main.py
# Visit http://localhost:8080
```

3. **Infrastructure (preview)**
- The `landing-zone/` contains modular Terraform code. Replace placeholders and run:
```bash
cd landing-zone
terraform init
terraform plan -var 'project_id=<GCP_PROJECT_ID>'
```

4. **Push images & deploy**
- Use `cloudbuild.yaml` (or GitHub Actions) to build and push the container image, then apply the `multi-cloud-demo/k8s-deployment.yaml` to a Kubernetes cluster.

---
## Project highlights (copy-paste for LinkedIn / resume)

**GCP Landing Zone (Terraform)** — modular IaC for VPC, IAM, logging, with example backend and CI trigger. Ready to extend for Shared VPC, service perimeter, and centralized logging.  
**Multi-Cloud Demo (GCP + OCI)** — identical app deployed across two clusters; demonstrates CI-driven deployments and centralized monitoring. Use this to show a technical lead you can avoid vendor lock-in.  
**GenAI Inference PoC** — pattern for serving inference safely: request queueing, autoscaling, secrets in Secret Manager/KMS, and explicit cost throttles (max replicas, queue depth limits).

---
## How to present this in interviews
- Link the repo in your LinkedIn Featured section. Recruiters click Featured first — make it easy.  
- For each interview, open the `landing-zone/main.tf` and explain choices: remote state, module boundaries, IAM binding patterns.  
- Show the `multi-cloud-demo` running locally or in a small cloud cluster and explain CI → build → deploy flow.  
- For GenAI topics, explain safety and cost controls: do not include model weights; use hosted endpoints or private model serving.

---
## Replace these placeholders before pushing live
- `landing-zone/main.tf` → `<REPLACE_WITH_STATE_BUCKET>`
- `multi-cloud-demo/k8s-deployment.yaml` → `<PROJECT_ID>` in image path
- `cloudbuild.yaml` → ensure `$PROJECT_ID` matches your GCP project

---
## Contact & social
**Sashi Perera** — Cloud Architect  
LinkedIn: https://www.linkedin.com/in/sashiperera/ · Credly: https://www.credly.com/users/sashi-perera.35c7414d/badges#credly · Email: <your-email>

---
## License
MIT © 2025 Sashi Perera
