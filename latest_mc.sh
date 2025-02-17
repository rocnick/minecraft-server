#!/bin/bash

outputFile="./server.jar"
if [ $# -eq 1 ]; then
  outputFile=$1
fi

wget -O $outputFile $(curl -L https://gist.github.com/cliffano/77a982a7503669c3e1acb0a0cf6127e9/raw/1868a831baa6ab466e506e638116e35ceaf025cd/minecraft-server-jar-downloads.md 2> /dev/null | head -n 3 | tail -1 | cut -d "|" -f 3)