# UD615: Scalable Microservices with Kubernetes

This is the code for [Scalable Microservices with Kubernetes](https://www.udacity.com/course/scalable-microservices-with-kubernetes--ud615).  In this course you will learn how to:

* Provision a complete Kubernetes using [Google Container Engine](https://cloud.google.com/container-engine)
* Deploy and manage Docker containers using kubectl

Kubernetes Version: 1.2.2

## Course Description

Kubernetes is all about applications and in this course you will utilize the Kubernetes API to deploy, manage, and upgrade applications. In this part of the workshop you will use an example application called "app" to complete the labs.

App is an example [12 Factor application](http://12factor.net/) that we'll be using throughout the course. During this course you will be working with the following Docker images:

* [udacity/example-monolith](https://hub.docker.com/r/udacity/example-monolith) - Monolith includes auth and hello services.
* [udacity/example-auth](https://hub.docker.com/r/udacity/example-auth) - Auth microservice. Generates JWT tokens for authenticated users.
* [udacity/example-hello](https://hub.docker.com/r/udacity/example-hello) - Hello microservice. Greets authenticated users.
* [nginx](https://hub.docker.com/_/nginx) - Frontend to the auth and hello services.

## Links

  * [Kubernetes](http://googlecloudplatform.github.io/kubernetes)
  * [gcloud Tool Guide](https://cloud.google.com/sdk/gcloud)
  * [Docker](https://docs.docker.com)
  * [etcd](https://coreos.com/docs/distributed-configuration/getting-started-with-etcd)
  * [nginx](http://nginx.org)
