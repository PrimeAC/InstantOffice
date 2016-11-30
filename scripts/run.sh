#!/usr/bin/env bash


docker rm lampBD -f &> /dev/null

docker run -d -e PASS="letmein" -e DOCKER_DEV="true" -p 80:80 -p 3306:3306 -v "$PWD":/app \
    -v "$PWD"/scripts/mysql-setup.sh:/mysql-setup.sh \
    -v "$PWD"/populate.sql:/sql/populate.sql \
    -v "$PWD"/schema.sql:/sql/schema.sql \
    -v "$PWD"/storedprocstriggers.sql:/sql/storedprocstriggers.sql \
    --name lampBD \
    dreigada/lamp
