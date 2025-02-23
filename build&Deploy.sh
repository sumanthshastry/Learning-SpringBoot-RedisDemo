#!/bin/bash

APP_NAME="redis-demo"
VERSION="0.0.1-SNAPSHOT"
DOCKER_IMAGE="${APP_NAME}:${VERSION}"
NAMESPACE="redis-namespace"

# Build the application
echo "Building the application..."
./gradlew clean build

# Generate Docker image
echo "Building Docker image..."
docker build -t ${DOCKER_IMAGE} .

# Push Docker image to registry (optional)
# echo "Pushing Docker image to registry..."
# docker push ${DOCKER_IMAGE}

# Clean up Kubernetes deployment
echo "Cleaning up Kubernetes deployment..."
kubectl delete -f k8s/redis-demo-service.yaml -n ${NAMESPACE}
kubectl delete -f k8s/redis-demo-deployment.yaml -n ${NAMESPACE}
kubectl delete -f k8s/redis-demo-pv.yaml -n ${NAMESPACE}
kubectl delete namespace ${NAMESPACE}

# Apply Kubernetes configurations
echo "Deploying application to Kubernetes..."
kubectl create namespace ${NAMESPACE}
kubectl apply -f k8s/redis-demo-pv.yaml -n ${NAMESPACE}
kubectl apply -f k8s/redis-demo-service.yaml -n ${NAMESPACE}
kubectl apply -f k8s/redis-demo-deployment.yaml -n ${NAMESPACE}

echo "Deployment complete."