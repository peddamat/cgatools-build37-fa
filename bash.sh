#!/bin/sh

docker exec -it $(docker ps |grep cgatools | cut -f1 -d' ') /bin/bash
