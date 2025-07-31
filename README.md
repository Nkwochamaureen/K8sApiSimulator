# K8sApiSimulator
🚀 Kubernetes API Simulator with Monitoring & Alerting

This project demonstrates a complete DevOps workflow using:

✅ Flask API containerized with Docker✅ Deployed on Minikube (local Kubernetes cluster)✅ Infrastructure managed with Terraform✅ Prometheus + Grafana for monitoring and alerting✅ Alertmanager integrated with email notifications

📂 Folder Structure

k8sApiSimulator/
│── api/                       # Flask application source code
│   ├── app.py                 # Flask app with Prometheus metrics
│   ├── requirements.txt       # Python dependencies
│   └── Dockerfile             # Docker build file for Flask API
│
│── K8s/                       # Kubernetes manifests
│   ├── deployment.yaml        # Deployment configuration for the API
│   ├── service.yaml           # Service exposing the API
│   └── servicemonitor.yaml    # ServiceMonitor for Prometheus
│
│── monitoring/                # Monitoring stack manifests
│   ├── prometheus-config.yaml       # Prometheus configuration
│   ├── prometheus-deployment.yaml   # Prometheus deployment
│   ├── prometheus-service.yaml      # Prometheus service
│   ├── grafana-deployment.yaml      # Grafana deployment
│   ├── grafana-service.yaml         # Grafana service
│   ├── grafana-pvc.yaml             # Grafana persistent storage
│   ├── flask-alert.yaml             # Prometheus alerting rule for API
│   └── alertmanager-config.yaml     # Alertmanager config for email alerts
│
│── terraform/                # Terraform files for infrastructure automation
│   └── main.tf               # Creates namespace, deployment, and service
│
│── README.md                 # Project documentation

🛠️ Features

✅ Fully automated deployment using Terraform✅ Flask app with Prometheus metrics exporter✅ Prometheus + Grafana integrated via ServiceMonitor✅ Alertmanager sending email alerts on failures✅ Works locally using Minikube (no cloud provider required)

🚀 Getting Started

1️⃣ Start Minikube

minikube start --driver=docker

2️⃣ Build and Load Docker Image into Minikube

eval $(minikube docker-env)
docker build -t nkwocha1234/api:latest ./api

3️⃣ Apply Terraform Infrastructure

cd terraform
terraform init
terraform apply -auto-approve

4️⃣ Deploy Monitoring Stack

kubectl apply -f monitoring/

5️⃣ Access the Flask API

minikube service api-service -n demo --url

6️⃣ Access Prometheus & Grafana

minikube service prometheus -n monitoring --url
minikube service grafana -n monitoring --url

📊 Grafana Setup

Open Grafana using the URL above.

Login (default: admin / admin).

Add Prometheus as a data source:

URL → http://prometheus:9090

Import dashboards or create new ones for API metrics.

📧 Alertmanager Setup

Alerts are configured in alertmanager-config.yaml

Alerts trigger emails if the Flask API is unreachable.

📐 Architecture Diagram

I can create a visual diagram showing:

Minikube Cluster

Flask App Pod

Prometheus + Grafana

Alertmanager

CI/CD Pipeline (Future enhancement)

🚀 Future Improvements

✅ Add CI/CD pipeline using GitHub Actions✅ Add Helm charts for better Kubernetes deployment✅ Add more Grafana dashboards for API performance monitoring

