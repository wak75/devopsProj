#!/bin/bash

# Check if account name is provided
syntax() {
    echo "Usage: $0 --ac <accountname>"
    exit 1
}

if [ "$#" -ne 2 ]; then
    syntax
fi

if [ "$1" != "--ac" ]; then
    syntax
fi

#printing the current working directory
pwd

#exporting the account name for later use
unset $account
export account=$2
echo $account

#Building the images
docker compose build

#Pushing the images to docker hub with provided account
docker compose push

#Creating deployments, Services and autoscaling in Kubernetes cluster for first and second deployments
envsubst <firstDeployment_v2.yaml | kubectl apply -f -

envsubst <secondDeployment_v2.yaml | kubectl apply -f -

#Getting the url of the service back
