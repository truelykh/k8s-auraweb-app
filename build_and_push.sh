#!/bin/bash
set -e

build_and_push() {
  local path=$1
  local image=$2
  echo "Building $image from $path..."
  docker build -t $image:1.0 $path
  echo "Pushing $image:1.0..."
  docker push $image:1.0
}

build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/user-auth kubeprojects/userauth
build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/shopping kubeprojects/shopping
build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/platform kubeprojects/platform
build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/order-payment kubeprojects/orderpayment
build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/inventory kubeprojects/inventory
build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/fulfillment kubeprojects/fulfilment
build_and_push ./ecommerce-platform/frontend kubeprojects/frontend
build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/catalog kubeprojects/catalog
build_and_push ./ecommerce-platform/admin kubeprojects/admin

echo "All images built and pushed successfully."
