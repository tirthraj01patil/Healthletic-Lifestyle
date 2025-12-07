#!/bin/bash
set -e

ENV=$1
VERSION=$2

echo "Deploying version $VERSION to $ENV"

aws eks update-kubeconfig --region us-east-1 --name $EKS_CLUSTER

helm upgrade --install healthletic-backend charts/ \
  --set image.tag=$VERSION \
  --wait

kubectl get pods
