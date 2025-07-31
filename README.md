# K8sApiSimulator
🚀 Kubernetes API Simulator with Monitoring & Alerting

This project demonstrates a complete DevOps workflow using:

✅ Flask API containerized with Docker
✅ Deployed on Minikube (local Kubernetes cluster)
✅ Infrastructure managed with Terraform
✅ Prometheus + Grafana for monitoring and alerting
✅ Alertmanager integrated with email notifications


🛠️ Features

✅ Fully automated deployment using Terraform
✅ Flask app with Prometheus metrics exporter
✅ Prometheus + Grafana integrated via ServiceMonitor
✅ Alertmanager sending email alerts on failures
✅ Works locally using Minikube (no cloud provider required)

🚀 Getting Started

1️⃣ Start Minikube

minikube start 

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

URL → http://prometheus:9090 or http://prometheus-operated:9090

Import dashboards or create new ones for API metrics.

📧 Alertmanager Setup

Alerts are configured in alertmanager-config.yaml

Alerts trigger emails if the Flask API is unreachable.


🚀 Future Improvements

✅ Add CI/CD pipeline using GitHub Actions
✅ Add Helm charts for better Kubernetes deployment
✅ Add more Grafana dashboards for API performance monitoring

