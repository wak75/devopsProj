#! /bin/bash

docker compose build
kubectl apply -f secondDeployment.yaml
kubectl apply -f firstDeployment.yaml
