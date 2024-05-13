#!/bin/bash

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

pwd

export account=$2
echo $account

# docker-compose build

# docker-compose push

envsubst <firstDeployment.yaml | kubectl apply -f -

envsubst <secondDeployment.yaml | kubectl apply -f -


output=$(minikube service --url back)

url=$(echo "$output" | awk '{print $NF}')

echo "URL: $url"