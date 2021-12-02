#!/bin/sh

mkdir -p output

docker run -it \
    --rm \
    -v "$(pwd)/output":/root/output \
    -v "/Users/me/AML Data/DELETE":/root/data \
    cgatools-build37-crr:latest \
    /bin/bash
