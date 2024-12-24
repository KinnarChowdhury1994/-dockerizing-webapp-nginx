# Containerization

## Dockerizing a Plain HTML Page With Nginx

## Objective: 
The objective is to familiarize with Docker and containerization by Dockerizing a simple HTML page using Nginx as the web server.

### Requirements:
1. Basic HTML Page:
   - Create a plain HTML page named `index.html` with some content (e.g., "Hello, Docker!").
2. Nginx Configuration:
   - Create an Nginx configuration file named `nginx.conf` that serves the `index.html` page.
   - Configure Nginx to listen on port 80.
3. Dockerfile:
   - Create a `Dockerfile` to define the Docker image.
   - Use an official Nginx base image.
   - Copy the `index.html` and `nginx.conf` files into the appropriate location in the container.
   - Ensure that the Nginx server is started when the container is run.
4. Building the Docker Image:
   - Build the Docker image using the `Dockerfile`.
5. Push the image on ECR
  - Make the public repository and push them on the ECR

### Documentation:

#### Purpose of Files
<!-- Provide a brief documentation (in a README.md file) explaining the purpose of each file (index.html, nginx.conf, Dockerfile) and the steps to build and run the Docker container. -->
 - index.html
    When a user enters a website's domain name without specifying a file, the web server automatically looks for an index.html file in the root directory and serves its content.

![image](https://github.com/user-attachments/assets/832b3ec8-5f72-4031-9648-c4e13be01990)
 
 - nginx.conf
   An Nginx configuration file is a text-based file that defines the rules and settings for how the Nginx web server should operate. It determines how Nginx handles incoming requests, processes them, and sends responses to clients.

![image](https://github.com/user-attachments/assets/e77e09b1-4ddb-4f2a-9faa-5cfd9336785d)

 - default.conf
   The defaults.conf file in Nginx serves as a global configuration file, providing default settings that apply to all server blocks within the main configuration file (typically nginx.conf). It allows you to define common parameters and configurations that can be reused across multiple virtual hosts.

![image](https://github.com/user-attachments/assets/ed42b72f-3b19-43b8-a8ca-c9ab90f2e884)

 - Dockerfile
   The Dockerfile i.e. Blueprint for Container Images is a text document that contains a series of instructions or commands used to build Docker images. These instructions specify the base image to use, the files and directories to add, and the commands to run within the container. Here are some key functions of a Dockerfile -
   1. Base Image Specification: The first line of a Dockerfile usually specifies the base image to use as a starting point for building the new image. This base image can be an official image from Docker Hub or a custom-built image.
   2. File and Directory Operations: You can use commands like COPY and ADD to add files and directories to the image. These commands can be used to include application code, libraries, and dependencies.
   3. Command Execution: You can execute commands within the container using the RUN command. This allows you to install packages, configure the environment, or perform other tasks necessary for your application.
   4. Environment Variables: You can set environment variables using the ENV command. These variables can be accessed within the container and used to configure the application's behavior.
   5. Exposing Ports: If your application needs to listen on specific ports, you can use the EXPOSE command to expose those ports. This allows other containers or hosts to connect to the application.
   6. Workdir: The WORKDIR command sets the working directory within the container. This directory will be the current directory for subsequent commands.

![image](https://github.com/user-attachments/assets/a74698c1-ea9e-4a74-910c-5b641f8752f4)


### Building the Docker Image

A Docker image is a lightweight, standalone, and executable package of software that includes everything an application needs to run, such as code, libraries, dependencies, and settings. It's essentially a snapshot of a container's filesystem at a particular point in time.

Docker images are created using a Dockerfile, which is a text file that contains a series of instructions for building an image. The Dockerfile specifies the base image, copies files, sets environment variables, and defines commands to run during the build process.

Components of a Docker Image:
 - Base Image: The starting point for the image, which can be another Docker image or a base operating system.
 - Layers: A series of read-only layers that make up the image, each representing a change or addition to the previous layer.
 - Container Configuration: Metadata that defines how the container should be run, such as environment variables, ports, and volumes.

Benefits of Docker Images:
 - Portability: Docker images can be run on any system that supports Docker, without worrying about compatibility issues.
 - Efficiency: Docker images are lightweight and use fewer resources than traditional virtual machines.
 - Consistency: Docker images ensure consistency across different environments, making it easier to develop, test, and deploy applications.

```bash
#! Go to the Project Directory. Before creating your docker image please ensure the docker engine is running
# ------ For Windows ------
# Check Docker Desktop Application in your windows or install it from https://docs.docker.com/desktop/install/windows-install/
# -------------------------
# ------- For Linux -------
# sudo systemctl status docker
# =========================

cd <project-directory>

docker build -t <image-name>:<tag-id> .
# e.g: docker build -t my-app:1.0 .
```
![image](https://github.com/user-attachments/assets/47df7f59-3f2c-45b7-b6c0-485aead2d356)

```bash
#! To List your docker images
docker images
```
![image](https://github.com/user-attachments/assets/bba60835-eade-41c5-9554-11704fb95bac)

### Push the image on ECR

Create an Private Image Repository in Amazon Elastic Container Registry (ECR) and use the following steps to authenticate and push an image to your repository.


1. Retrieve an authentication token and authenticate your Docker client to your registry. Use the AWS CLI:

aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 975050024946.dkr.ecr.ap-south-1.amazonaws.com

Note: If you receive an error using the AWS CLI, ensure you have installed the latest version of the AWS CLI and Docker.


2. Build your Docker image using the following command. You can skip this step if your image is already built (InMy Case, My Image name is my-app:1.0):

docker build -t kinnarchowdhury/dockerizing-nginx .


3. After the build completes, tag your image so you can push the image to this repository:

docker tag my-app:1.0 975050024946.dkr.ecr.ap-south-1.amazonaws.com/kinnarchowdhury/dockerizing-nginx:latest



4. Run the following command to push this image to your newly created AWS repository:

docker push 975050024946.dkr.ecr.ap-south-1.amazonaws.com/kinnarchowdhury/dockerizing-nginx:latest


After Pushing the Image you can validate the image in the ECR whether it is available in your repository.


References:

https://www.google.com/
https://docs.docker.com/
https://docs.aws.amazon.com/ecr/
https://vlearnv.herovired.com/program-timeline/186




