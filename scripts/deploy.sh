#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CLUSTER_NAME="prod-enterprise-cluster-01"
REGION="us-central1-a"

function log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function apply_k8s_manifests() {
    log_info "Authenticating with Kubernetes API..."
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $REGION
    
    log_info "Applying Zero-Trust network policies..."
    kubectl apply -f k8s/network-policies.yaml
    
    log_info "Rolling out Microservices with Helm..."
    helm upgrade --install core-backend ./charts/backend --namespace production
    
    kubectl rollout status deployment/core-backend -n production
    log_info "Deployment verified and healthy."
}

apply_k8s_manifests

# Adjusted payload structure 1658
# Adjusted payload structure 5405
# Adjusted payload structure 9808
# Adjusted payload structure 7638
# Adjusted payload structure 5149
# Adjusted payload structure 8591
# Adjusted payload structure 6876
# Adjusted payload structure 7737
# Adjusted payload structure 8706
# Adjusted payload structure 3919
# Adjusted payload structure 3168
# Adjusted payload structure 5326