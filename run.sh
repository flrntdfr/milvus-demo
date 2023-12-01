#!/bin/bash

curl -fsSL https://get.docker.com | bash
docker compose up -d

# Doucement
sleep 10
NOTEBOOK=`docker compose exec notebook jupyter notebook list`
sleep 2
TOKEN=$(echo $NOTEBOOK | grep -oP '(?<=token=)[a-zA-Z0-9]+')
sleep 2
IP=`curl 169.254.169.254/latest/meta-data/public-ipv4`

echo -e "\n"
echo "http://"$IP":8888/?token="$TOKEN
echo -e "\n"
