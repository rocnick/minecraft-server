# Use Ubuntu's latest image
FROM ubuntu:latest

# Update and install jdk + wget
RUN apt update && apt upgrade -y
RUN apt install wget openjdk-21-jdk -y

# Download Minecraft to the /minecraft directory for running
RUN mkdir /minecraft
WORKDIR /minecraft

# This is configured to download Minecraft: Java Edition v1.21.4
#RUN wget https://piston-data.mojang.com/v1/objects/4707d00eb834b446575d89a61a11b5d548d8c001/server.jar

# This leverages the latest mc download script's output
COPY ./build/server.jar /minecraft/server.jar

# Runs the server once so the eula.txt file exists
RUN java -Xms2048M -Xmx2048M -jar server.jar nogui

# Mark the EULA as agreed to
RUN rm eula.txt
RUN echo "eula=true" > eula.txt

# Run the Minecraft server on container start
# Note: This is running with 2gb of memory made available
ENTRYPOINT java -Xms2048M -Xmx2048M -jar server.jar nogui && /bin/bash

# Useful for troubleshooting your dockerfile - very useful
# ENTRYPOINT ["tail", "-f", "/dev/null"]