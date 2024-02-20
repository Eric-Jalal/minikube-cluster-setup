## Minikube Cluster Monitoring with Prometheus and Grafana

This project demonstrates how to set up a basic monitoring system on a Minikube cluster using Prometheus for metrics collection and Grafana for metrics visualization. It uses Terraform to prepare the Kubernetes environment and Kubernetes manifests for deploying Prometheus and Grafana.

### Prerequisites

Before you start, ensure you have the following installed on your local machine:

- Minikube
- kubectl
- Terraform

### Getting Started

Follow these steps to set up the monitoring system:

1. Start Minikube
Start your Minikube cluster:
`minikube start`

2. Apply Terraform Configuration

Navigate to the Terraform directory and initialize the Terraform project:
`terraform init`

Apply the Terraform configuration to create the monitoring namespace in your Minikube cluster:
`terraform apply`

Confirm the creation when prompted.

3. Deploy Prometheus and Grafana

Navigate to the kubernetes directory where the Kubernetes manifests are located. Apply the manifests in the following order:

3.1. Prometheus ConfigMap

`kubectl apply -f prometheus-config.yaml`

3.2. Prometheus Deployment and Service
```
kubectl apply -f prometheus-deployment.yaml
kubectl apply -f prometheus-service.yaml
```

3.3. Grafana Deployment and Service
```
kubectl apply -f grafana-deployment.yaml
kubectl apply -f grafana-service.yaml
```
4. Accessing Prometheus and Grafana

Prometheus: Forward the Prometheus service port to access the Prometheus web UI:

```kubectl port-forward service/prometheus-service 9090:9090 -n monitoring`

Access Prometheus at http://localhost:9090.

Grafana: Forward the Grafana service port to access the Grafana dashboard:

```kubectl port-forward service/grafana-service 3000:3000 -n monitoring```

Access Grafana at http://localhost:3000. The default login is admin with password admin.

## Conclusion
This project sets up a basic monitoring system on a Minikube cluster using Prometheus and Grafana. It is intended for learning and development purposes. For a production environment, further customization and security considerations are necessary.

## Troubleshooting
If you encounter any issues accessing Prometheus or Grafana, ensure that all pods are running and that port forwarding is correctly set up. Check the logs of the pods for any errors:

```kubectl logs <pod-name> -n monitoring```

