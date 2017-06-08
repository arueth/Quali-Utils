# Quali-Utils
This repository contains the docker-compose files, swarm files, and some basic scripts for running the Quali-Utils container stack.

## Components
### Quali-Utils-NodeJS
* Image: https://hub.docker.com/r/arueth/quali-utils-nodejs
* Source: https://github.com/arueth/Quali-Utils-NodeJS

### Quali-Utils-Cron
* Image: https://hub.docker.com/r/arueth/quali-utils-cron
* Source: https://github.com/arueth/Quali-Utils-Cron

## How to use with Docker Swarm
#### 1. Create the ClouldShell username and password secrets
    $ echo "username" | docker secret create cloudshell_user
    $ echo "password" | docker secret create cloudshell_password

#### 2. Configure CloudShell domain and server in the docker-compose.swarm.yml file
    version: '3.1'
    
    services:
      ...
      cron:
        ...
        environment:
          - CLOUDSHELL_DOMAIN=Global
          - CLOUDSHELL_SERVER=localhost
#### 3. Deploy the stack
    $ bin/docker_stack_deploy.sh

## How to use with Docker Compose
#### 1. Set the ClouldShell username and password secrets
    $ vim dev-secrets/cloudshell_user.txt
    $ vim dev-secrets/cloudshell_password.txt

#### 2. Configure CloudShell domain and server in the docker-compose.override.yml file
    version: '3.1'
    
    services:
      ...
      cron:
        environment:
          - CLOUDSHELL_DOMAIN=Global
          - CLOUDSHELL_SERVER=localhost

#### 3. Bring up the configuration
    $ bin/docker_compose_up.sh
