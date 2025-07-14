#!/bin/bash

set -e

echo "🔄 Using Minikube Docker environment..."
eval $(minikube docker-env)

echo "🐳 Building Docker image..."
docker build -t api:latest ./api

echo "📦 Applying Kubernetes manifests..."
kubectl apply -f ./k8s/deployment.yaml
kubectl apply -f ./k8s/service.yaml

echo "📐 Running Terraform..."
cd terraform
terraform init
terraform apply -auto-approve
cd ..

echo "✅ Done. Access your API using:"
minikube service api-service --url
