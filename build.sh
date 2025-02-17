#!/bin/bash

# Allows the user to specify the dockerfile to use
dockfile=Dockerfile
if [ $# -ge 1 ]; then
  dockfile=$1
fi

# Downloads the latest Minecraft server
mkdir ./build
./latest_mc.sh

docker build -t minecraft-server -f $dockfile .