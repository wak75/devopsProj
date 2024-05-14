# Project Setup Guide

### Table of Contents
1. [Prerequisites](#docker-installation)
2. [MiniKube and Kubectl installation](#minikube-and-kubectl-installation)
3. [Beginner Setup](#beginner-setup)
   1. [How to run](#how-to-runbeginner)
   2. [Accessing the application](#final-step-access-your-application)
4. [Best Practices Steps](#best-practices-steps)
   1. [Prequisites](#prerequisites-1)
      1. [Docker Login](#logging-into-docker-hub-via-terminalcommand-line)
      2. [Installing `envsubst`](#installing-envsubst-on-macos-windows-and-linux)
   2. [How to run (Best Practice)](#how-to-run-best-practice)
5. [Basic Debugging steps](#debugging-issues)
    1. [simple debugging instructions for Basic step](#checking-for-the-basic-step)
    2. [simple debugging instructions for Best practice step](#check-for-the-best-practice-part)
6. [Cleanup](#cleanup)
## Prerequisites

Before you begin, ensure you have met the following prerequisites:

### Docker Installation

1. **Check if Docker is Installed**: Open a terminal and type `docker --version`. If Docker is installed, this command will display the version of Docker installed on your system. If it's not installed, you'll see a message indicating that the command was not found.

2. **Install Docker** (if not installed):
   - **For macOS**:
     - Download Docker Desktop for Mac from the [official Docker website](https://www.docker.com/products/docker-desktop).
     - Follow the installation instructions provided by Docker Desktop.
   - **For Windows**:
     - Download Docker Desktop for Windows from the [official Docker website](https://www.docker.com/products/docker-desktop).
     - Follow the installation instructions provided by Docker Desktop.
   - **For Linux**:
     - Use the package manager for your distribution to install Docker. For example, on Ubuntu, you can use `sudo apt-get update` followed by `sudo apt-get install docker-ce docker-ce-cli containerd.io`.

### Minikube and kubectl Installation

1. **Check if Minikube and kubectl are Installed**: Open a terminal and type `minikube version` and `kubectl version --client`. If Minikube and kubectl are installed, these commands will display the versions of Minikube and kubectl installed on your system. If they're not installed, you'll see a message indicating that the command was not found.

2. **Install Minikube and kubectl** (if not installed):
   - **For macOS and Windows**:
     - Download Minikube from the [official GitHub releases page](https://github.com/kubernetes/minikube/releases).
     - Install Minikube by following the instructions provided in the release notes.
     - Install kubectl by following the instructions on the [official Kubernetes documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl/).
   - **For Linux**:
     - Install Minikube using your distribution's package manager. For example, on Ubuntu, you can use `sudo snap install minikube`.
     - Install kubectl by following the instructions on the [official Kubernetes documentation](https://kubernetes.io/docs/tasks/tools/install-kubectl/).

After completing these steps, you should have Docker, Minikube, and kubectl installed and ready to use for your project setup.


# Beginner Setup: 

### NOTE: This section is beneficial for those who want a quick setup without needing to push images to Docker Hub, and have a low system specifications.
**Advantages**: It does not require you to have a dockerhub ID, as you will not going to push anything into it. All docker images created will stay in your local system. It also has lesser resource requirement.

For those looking for a quick setup, follow these steps:

`Ignore the folder "advance" as we will use the folder and its contents for more advanced setup in later steps.`

## How to run(Beginner): 
*Just execute the script ./script.sh, it will take care of all necessary setps for you.*\
 (If you are on mac or linux, you might change the permission of the file script.sh using `chmod +x script.sh` before running it.)

By following these steps, you'll have a simple yet powerful setup ready for development or testing purposes. The script automates common tasks like building Docker images, deploying applications, and exposing services - allowing you to focus on your code instead of infrastructure configuration.

## The Script will:
1. **Script Execution**:  This script automates the process of creating two Docker images, `washim/front` and `washim/back`, using the provided `docker-compose.yml` file in `default` namespace. You can find more details about Docker Compose in the [official Docker documentation](https://docs.docker.com/compose/).

2. **Deployments Creation**: The script will then proceed to create two deployments from files `firstDeployment.yaml` and `secondDeployment.yaml`. These deployments are internally connected via a ClusterIP service, which allows them to communicate within the cluster. Learn more about Kubernetes ClusterIP services in the [official Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/service/#clusterip-service).

3. **Exposure via LoadBalancer**: Finally, the script configures the deployments to be exposed outside the cluster using a LoadBalancer service. This makes the applications accessible over the network. For more information on Kubernetes LoadBalancer services, refer to the [official Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer).


## Final Step: Access Your Application

After completing the setup, you can access your application by executing the following command in your terminal:

`minikube service back --url`

This command will provide you with the URL where your application is accessible. Additionally, it will attempt to open this URL in your default web browser automatically. If for some reason the browser does not open, you can manually copy the provided URL and paste it into your preferred web browser to access your application.

For more information on accessing applications running within Minikube, you can refer to the [official Minikube documentation](https://minikube.sigs.k8s.io/docs/handbook/accessing/).

====================================================================================

# Best Practices Steps:

## Pushing Docker Images to Docker Hub
This section guides you through pushing your Docker images to Docker Hub, allowing you to easily deploy your applications anywhere. Before proceeding, ensure you have a Docker Hub account and are logged in.

`Note: If you want to build the dockers locally and dont want to push it into your dockerhub account, first run the command < eval $(minikube -p minikube docker-env) > in the terminal then comment out the line number 29 in /advance/script.sh file.`

## Prerequisites

- A Docker Hub account.
- Docker installed and configured on your machine.
- Docker CLI authenticated with Docker Hub.
- 'envstub' installed in your machine.

## Installing `envsubst` on macOS, Windows, and Linux

`envsubst` is a utility that substitutes the values of environment variables. It is part of the `gettext` package. Here's how to install `envsubst` on macOS, Windows, and Linux:

### macOS

1. **Install `gettext` using Homebrew**:
bash `brew install gettext`

   [Homebrew](https://brew.sh)

2. **Link `gettext` to make `envsubst` accessible**:
bash `brew link --force gettext`

   [Homebrew](https://brew.sh)

### Linux and MacOS

1. **Download and install `envsubst`**:
bash curl -L https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-`uname -s-uname -m` -o envsubst chmod +x envsubst sudo mv envsubst /usr/local/bin

   [GitHub](https://github.com/a8m/envsubst)

### Windows

1. **Download the latest prebuilt binary** from the GitHub releases page:
`powershell curl -L https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst.exe`

   [GitHub](https://github.com/a8m/envsubst)


## Logging into Docker Hub via Terminal/Command Line

To log into Docker Hub from the command line, use the `docker login` command. This command prompts you for your Docker Hub username and password. If you encounter any issues or need more options, you can use `docker login --help` to see the available options.

## How to run (Best Practice): 
1. **Navigate into the advance folder by using commnd `cd advance/`, we will use the files and configurations in this folder for the advanced setup.**
2. **Execute the script by running ./script.sh --ac <your_dockerhub_username>**
3. **Once the script is executed successfully, enter the following command `minikube service back -n devops --url` to get the URL to access the application.**

This section outlines the process of executing the `script.sh` file, which automates the creation of containers and deployments based on the provided account name. The script leverages Kubernetes YAML files to define and manage the deployments.

## The Script will: 

1. **Running the Script**: This script takes an account name as input and performs the following actions:

    - Creates namespace `devops` if not present already, where all resources will be deployed.
    - Creates two containers named `<account>/front` and `<account>/back` based on the provided account name.
    - Internally connects these containers via a default ClusterIP service, allowing them to communicate within the cluster.
    - Externally exposes these containers via a LoadBalancer service, making them accessible over the network.

2. **YAML Files**: The script internally calls `firstDeployment_v2.yaml` and `secondDeployment_v2.yaml` to create the deployments. These YAML files define the deployments and their configurations, including the container names, image specifications, and resource limits, along with the service definitions.

3. **Automatic Scaling**: The YAML files also include configurations for automatic scaling of deployment pods (Horizontal pod autoscaling). Kubernetes will automatically adjust the number of pod replicas based on the defined criteria, such as CPU usage or custom metrics.

4. **Bonus**: You can also use the .env file to setup your account name dynamically instead of passing it as a command line argument in the script.


## Debugging issues:

Incase if the script is not working properly, or fails you can manually use the following commands to check weather everything is working fine or not.

Use the command `docker images` to verify weather the images creation is successful or not.(Common for both the steps)

### Checking for the Basic step:

1. **check the deployment**: `kubectl get deployments`: This command will list all the deployments in the `default` namespace.
2. **check the pods**: `kubectl get pods`: This command will list all the pods in the `default` namespace.
3. **check the services**: `kubectl get svc`: This command will list all the services in the `default` namespace.


### Check for the best practice part:
1. **Check the namespace**: `kubectl get ns`: This command will list all the namespaces in your cluster.
2. **Check the pods**: `kubectl get pods -n devops`: This command will list all the pods in the `devops` namespace.
3. **Check the services**: `kubectl get svc -n devops`: This command will list all the services in the `devops` namespace.
4. **Check the deployments**: `kubectl get deployments -n devops`: This command will list all the deployments in the `devops` namespace.
5. **Check the HPA**: `kubectl get hpa -n devops`: This command will list all the HPA in the `devops` namespace.

# Cleanup

1. **Cleanup for the Basic Step**: As all the resources are in `default namespace` of the minikube, just run the command `kubectl delete all --all` to cleanup everything.

> :warning: **the above command will clear all the resources like deployment, service, HPA, ingress etc**: Be very careful here!

if you dont want to delete all your images, you can selectively delete the resources like:
  1. `kubectl delete deployment <deployment_name>`: This will delete the deployment with given name.
  2. `Kubectl delete svc <service_name>`: This will delete the service with given name.
  
  In the basic step we have used deployment and svc only, hence the above commands will be sufficient to delete the specific resources.

2. **Cleanup for the Best practice Step** As we have create all the resources in the specific namespace `devops`, we can selectively delete the resources from that namespace only to avoid deleting other namespaces resources accidentally

Run the command `kubectl delete all -n devops --all`, this will successfully delete all the resources from the namespace devops. 

> :warning: **the above command will clear all the resources like deployment, service, HPA, ingress etc from the resource devops**: Be careful if you dont want to delete all the resource here!

If you want to delete specific resources from devops namespace selectively you can use:
  1. `kubectl delete deployment <deployment_name> -n devops`: This will delete the deployment with given name in devops namespace.
  2. `Kubectl delete svc <service_name> -n devops`: This will delete the service with given name.
  3. `kubectl delete hpa <hpa_name> -n devops`: This will delete the horizontal pod autoscaler with given name.
  4. `kubectl delete namespace devops` : This will delete the entire devops namespace along with all the resources.
  





