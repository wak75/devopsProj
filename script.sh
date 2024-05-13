#! /bin/bash


#the following command constructs images for services defined in docker-compose.yml,
#facilitating consistent, reproducible builds. 

docker compose build

#he command kubectl apply -f <filename>.yaml applies the configuration defined in .yaml to the Kubernetes cluster,
#creating or updating resources as specified in the file.
kubectl apply -f secondDeployment.yaml

kubectl apply -f firstDeployment.yaml
