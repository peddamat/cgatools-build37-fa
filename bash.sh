#!/bin/sh

docker exec -it $(docker ps |grep cgatools-build37-fa | cut -f1 -d' ') /bin/bash
