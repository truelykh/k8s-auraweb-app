#!/bin/bash
set -e

build_and_push() {
  local path=$1
  local image=$2
  echo "Building $image from $path..."
  docker build --platform linux/amd64 -t $image:2.0 $path
  echo "Pushing $image:2.0..."
  docker push $image:2.0
}

# build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/user-auth kubeprojects/userauth
# build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/shopping kubeprojects/shopping
# build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/platform kubeprojects/platform
# build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/order-payment kubeprojects/orderpayment
# build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/inventory kubeprojects/inventory
# build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/fulfillment kubeprojects/fulfilment
# build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/frontend kubeprojects/frontend
build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/catalog kubeprojects/catalog
build_and_push ./misc/docker-nginx-react-kubernetes-fullstack/services/admin kubeprojects/admin

echo "All images built and pushed successfully."
