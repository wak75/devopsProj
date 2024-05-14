#! /bin/bash
 
 #This command points our terminal to use the docker daemon inside minikube. 
 #So now all the docker commands we will run will be run on docker in the minikube cluster and not on our host machine. So now we can directly build the docker image in our minikube docker.
eval $(minikube -p minikube docker-env)
 
#the following command constructs images for services defined in docker-compose.yml,
#facilitating consistent, reproducible builds.
 
docker compose build

# Function to check if the deployment is running
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
 
# Main script
deployment_name="front"
 
# Check if the deployment is running
if check_deployment "$deployment_name" ; then
    # Delete the deployment
    echo "Deleting existing deployment..."
    kubectl delete -f firstDeployment.yaml -f secondDeployment.yaml
    echo "Deployment deleted."
 
    # Apply the deployment again
    echo "Applying deployment..."
    # the command kubectl apply -f <filename>.yaml applies the configuration defined in .yaml to the Kubernetes cluster,
# creating or updating resources as specified in the file.
    kubectl apply -f firstDeployment.yaml 
    kubectl apply -f secondDeployment.yaml
    echo "Deployment applied."
    echo "use command 'minikube service back --url' to get the url of the service"
else
    echo "Deployment not found, so Creating deployment..."
    # the command kubectl apply -f <filename>.yaml applies the configuration defined in .yaml to the Kubernetes cluster,
    # creating or updating resources as specified in the file.
    kubectl apply -f firstDeployment.yaml 
    kubectl apply -f secondDeployment.yaml
    echo "Deployment applied."
    echo "use command 'minikube service back --url' to get the url of the service"
fi
 


 