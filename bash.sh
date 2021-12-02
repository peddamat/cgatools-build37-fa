#!/bin/sh

docker exec -it $(docker ps |grep cgatools-build37-crr | cut -f1 -d' ') /bin/bash
