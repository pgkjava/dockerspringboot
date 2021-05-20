# Getting Started with Spring Boot with Docker

## Creating a Java Spring Boot Project
This project was initialized by following the quick start guide [Spring Boot with Docker](https://spring.io/guides/gs/spring-boot-docker/).

Created a Spring Boot Gradle project using IntelliJ's Spring Initializr service. Spring Web and Spring Boot DevTools are the dependencies for this project.

## Containerize It Using Dockerfile

A custom image is built using a Dockerfile.
The Dockerfile is based on a Gradle image. The script copies the relevant project files to the '/usr/app' folder in the generated custom docker image. The cmd instruction runs the gradle bootRun task at runtime when a container is created from the image. The bootRun task runs the project as a sping boot application inside the container.
The docker container will eventually be deployed to AWS elastic beanstalk. To support this the default port is changed from 8080 to 5000 in the src/main/resources/application.properties file using:
server.port=5000

## `Building the image from the docker file`
In a powershell or gitbash, in the root folder of the project, run the docker command:

###'docker build -t <imagename> .'
-t option names the image
. is the path where the Dockerfile is located (current folder)

## `Creating and running a docker container from the custom docker image`
###'docker run -it --name <containername> -p 5000:5000' <imagename>
-it option is the interactive mode to view the output generated from the container
--name option assigns a name to the container
-p maps the port of the host machine to the port of the container

## `Creating a container during development to quickly test changes in souce files without have to rebuild an image everytime`
###'docker run -it -p 5000:5000 -v ${PWD}/src:/usr/app1/src -e CHOKIDAR_USEPOLLING=true <imagename>'
-v volume tag to map the src folder in the project folder to the src folder in the container
-e CHOKIDAR_USEPOLLING=true environment variable to detect changes

## `Viewing the rest end point`
###'localhost:5000'
in the browser displays the Welcome message from the application running inside the container.

