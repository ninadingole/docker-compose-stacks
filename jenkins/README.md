# Jenkins Setup

This repository contains a Docker Compose configuration for setting up Jenkins with an agent for building projects.

## Prerequisites

- Docker
- Docker Compose

## Services

### Jenkins Master

The Jenkins master service is based on the `jenkins/jenkins:lts` image and provides the Jenkins web interface.

- Access the Jenkins web interface at [http://localhost:8080](http://localhost:8080)
- Use the initial admin password to unlock Jenkins (found in the Jenkins logs or inside the container)

### Jenkins Agent

The Jenkins agent service is based on the `jenkins/ssh-agent:jdk11` image and provides the agent for building projects.

- Configure the agent in Jenkins using the SSH public key provided in the `JENKINS_AGENT_SSH_PUBLIC_KEY` environment variable.

## Usage

1. Create a .env file with the following content

   ```bash
   JENKINS_AGENT_SSH_PUBLIC_KEY=YOUR_SSH_PUBLIC_KEY_HERE
   ```
   Note: Replace YOUR_SSH_PUBLIC_KEY_HERE with your actual SSH public key. If you don't have an SSH key, you can generate one using the following command:
   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```
   Follow the prompts to generate the SSH key. The public key will be saved to ~/.ssh/id_rsa.pub.

2. Start the Jenkins services:
   ```bash
   docker-compose up -d
   ```