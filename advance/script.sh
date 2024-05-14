#!/bin/bash

# Function to check if account name is provided
syntax() {
    echo "Usage: $0 --ac <accountname> [--ver <version>]"
    exit 1
}

# Initialize version variable with default value
version="latest"

# Parse command line arguments
while (( "$#" )); do
    case "$1" in
        --ac)
            shift
            account="$1"
            ;;
        --ver)
            shift
            version="$1"
            # Validate version in semver format
            rx='^([0-9]+\.){2}(\*|[0-9]+)(-.*)?$'
            if [[ $version =~ $rx ]]; then
                echo "Valid semver version: $version"
            else
                echo "ERROR: Unable to validate package version: '$version'. Please provide a valid semver version."
                exit 1
            fi
            ;;
        *)
            syntax
            ;;
    esac
    shift
done

# Check if account name is provided
if [ -z "$account" ]; then
    syntax
fi

# Printing the current working directory
pwd

# Exporting the account name for later use
unset $account
export account=$account
export version
echo $account

# Building the images
docker compose build

# Pushing the images to Docker Hub with provided account
docker compose push



check_deployment() {
    local deployment_name=$1
    
    # Check if the deployment exists
    if kubectl get deployment $deployment_name > /dev/null 2>&1; then
        echo "Deployment $deployment_name exists."
        return 0
    else
        echo "Deployment $deployment_name does not exist"
        return 1
    fi
}
deployment_name="front"

if check_deployment "$deployment_name" ; then
    echo "Deleting existing deployment..."
    kubectl delete -f firstDeployment.yaml -f secondDeployment.yaml
    echo "Deployment deleted."
    # Apply the deployment again
    echo "Applying deployment..."
# Creating deployments, Services, and autoscaling in Kubernetes cluster for first and second deployments

    envsubst <firstDeployment_v2.yaml | kubectl apply -f -
    envsubst <secondDeployment_v2.yaml | kubectl apply -f -
    echo "Deployment restarted."
    echo "use command 'minikube service back -n devops --url' to get the url of the service"
else
    echo "creating Deployment..."
    envsubst <firstDeployment_v2.yaml | kubectl apply -f -
    envsubst <secondDeployment_v2.yaml | kubectl apply -f -
    echo "Deployment applied."
    echo "use command 'minikube service back -n devops --url' to get the url of the service"
fi
