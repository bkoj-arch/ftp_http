#!/bin/bash

if [ -z $1 ]
then
	echo "Il faut mettre votre cle publique en argument"
	exit 1
fi

cd nginx
docker build -t dark_nginx .

cd ../proftpd 

ssh-keygen -e -f $1 |grep -v "omment" > id_rsa.pub

## generation du certificat TLS et sa cle pour nginx
docker build -t dark_proftpd .

docker volume create dark_vol
docker network create --subnet=1.2.3.0/24 --gateway=1.2.3.1 dark_net

docker run -p 2222:2222 --network=dark_net --ip=1.2.3.3 -v dark_vol:/home/dev --rm -d --name proftpd dark_proftpd
docker run -p 443:443 -p 80:80 --network=dark_net --ip=1.2.3.2 -v dark_vol:/var/www/html --rm -d --name nginx dark_nginx

