# 🧠 Homelab Playground

[![AI-Powered](https://img.shields.io/badge/AI%20Enhanced-%E2%9C%94%EF%B8%8F-blueviolet)](https://openai.com)
[![Declarative Infra](https://img.shields.io/badge/Declarative-Infrastructure-informational)]()
[![Made With ❤️](https://img.shields.io/badge/Built%20With-Love-red)]()

Welcome to my **homelab project** — a place to learn, experiment, and push the boundaries of what I can automate, self-host, and manage declaratively.

## 🌟 Why This Project Exists

This repo serves as the home base for my homelab exploration. It's my public notebook, my sandbox, and my digital lab.

### 🧠 Goals

- ✅ **Play with cool tools** — Kubernetes, Proxmox, Talos, OpenTofu, Digger, Istio, Argo CD, Helm, and more
- ✅ **Declaratively manage everything** — GitOps, Infrastructure as Code (IaC), and Configuration as Code (CaC)
- ✅ **Use AI to write code & docs** — Treating AI as a pair programming buddy
- ✅ **Host real services** — Things I'll actually use day-to-day

## 🧾 Architecture Decision Records (ADRs)

Every technical decision I make will have a corresponding ADR.

This serves two purposes:

1. **AI Context** – Future code changes or generations will be AI-informed based on historical decisions.
2. **Self-Documentation** – So I can look back and understand why I made a particular call.

> 💡 ADRs live in the `/adrs` directory. They are short, focused, and written in plain English.

## 🖥️ Current Hardware Setup

| Node | Description |
|------|-------------|
| 🖥️ Minisforum MS-01 | Intel i9-13900H, 96GB RAM, NVMe SSD (Running Proxmox) |

- Currently running a **single-node Kubernetes cluster**.
- Designed for future expansion into a multi-node cluster.
- Will eventually connect with **SaaS** services for hybrid workflows and backups.

## 🛠️ Tooling in Use (or Planned)

- **Kubernetes**  → Container orchestration
- **TALOS** → Evaluating for immutable, secure k8s OS
- **Proxmox** → Hypervisor and VM orchestration
- **OpenTofu** → Declarative infra
- **Digger** → OpenTofu CI/CD automation
- **Argo CD** → GitOps continuous deployment
- **Helm** → App templating
- **Istio** → Service mesh and ingress

## 🧠 AI-Driven Workflow

I'll be using AI (like ChatGPT, Claude, Windsurf, Avante) not just for troubleshooting, but to:

- Generate code/configs
- Explain design patterns
- Review ADRs
- Suggest improvements

## 📅 Roadmap

- [x] Setup Dev Environment
- [x] Deploy Github Private Runners
- [] Setup Digger for Opentofu CI/CD
- [ ] Setup Proxmox Cluster with additional hardware
- [ ] Deploy Single Node Talos Cluster (with OpenTofu)
- [ ] Implement GitOps with Argo CD
