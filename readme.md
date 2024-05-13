# Project Setup Guide

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

# Easy Setup

For those looking for a quick setup, follow these steps:
**Advantages**: It does not require you to have a dockerhub ID, as you will not going to push anything into it. All docker images created will stay in your local system.

**Ignore the folder `advance` as we will use the folder and its contents for more advanced setup in later steps.**

1. **Run the Script**: Execute the `script.sh` file. This script automates the process of creating two Docker images, `was24/front` and `was24/back`, using the provided `docker-compose.yml` file. You can find more details about Docker Compose in the [official Docker documentation](https://docs.docker.com/compose/).

(If you are on mac or linux, you might change the permission of the file script.sh using `chmod +x script.sh` before running it.)

2. **Deployments Creation**: The script will then proceed to create two deployments from files `firstDeployment.yaml` and `secondDeployment.yaml`. These deployments are internally connected via a ClusterIP service, which allows them to communicate within the cluster. Learn more about Kubernetes ClusterIP services in the [official Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/service/#clusterip-service).

3. **Exposure via LoadBalancer**: Finally, the script configures the deployments to be exposed outside the cluster using a LoadBalancer service. This makes the applications accessible over the network. For more information on Kubernetes LoadBalancer services, refer to the [official Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer).

By following these steps, you'll have a simple yet powerful setup ready for development or testing purposes. The script automates common tasks like building Docker images, deploying applications, and exposing services - allowing you to focus on your code instead of infrastructure configuration.

# Final Step: Access Your Application

After completing the setup, you can access your application by executing the following command in your terminal:

`minikube service back --url`

This command will provide you with the URL where your application is accessible. Additionally, it will attempt to open this URL in your default web browser automatically. If for some reason the browser does not open, you can manually copy the provided URL and paste it into your preferred web browser to access your application.

For more information on accessing applications running within Minikube, you can refer to the [official Minikube documentation](https://minikube.sigs.k8s.io/docs/handbook/accessing/).

# Advanced Steps:

## Pushing Docker Images to Docker Hub
This section guides you through pushing your Docker images to Docker Hub, allowing you to easily deploy your applications anywhere. Before proceeding, ensure you have a Docker Hub account and are logged in.

## Prerequisites

- A Docker Hub account.
- Docker installed and configured on your machine.
- Docker CLI authenticated with Docker Hub.

## Logging into Docker Hub via Terminal/Command Line

To log into Docker Hub from the command line, use the `docker login` command. This command prompts you for your Docker Hub username and password. If you encounter any issues or need more options, you can use `docker login --help` to see the available options.

1. **Advance Folder**: Navigate into the `advance` folder, and execute the `script.sh`.




