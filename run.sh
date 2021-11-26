#!/bin/sh

mkdir -p output

docker run -it \
    --rm \
    -v "$(pwd)/output":/root/output \
    cgatools:latest \
    /bin/bash
