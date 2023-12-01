#!/bin/bash

curl -fsSL https://get.docker.com | bash
docker compose up -d

NOTEBOOK=`docker compose exec notebook jupyter notebook list`
TOKEN=$(echo $NOTEBOOK | grep -oP '(?<=token=)[a-zA-Z0-9]+')
IP=`curl 169.254.169.254/latest/meta-data/public-ipv4`

echo -e "\n"
echo "http://"$IP":8888/?token="$TOKEN
echo -e "\n"
