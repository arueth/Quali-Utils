#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker stack deploy -c ${DIR}/../docker-compose.yml -c ${DIR}/../docker-compose.swarm.yml qualiutils
