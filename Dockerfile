# Use Ubuntu's latest image
FROM ubuntu:latest

# Update and install jdk + wget
RUN apt update && apt upgrade -y
RUN apt install wget openjdk-17-jdk -y

# Download Minecraft to the /minecraft directory for running
RUN mkdir /minecraft
WORKDIR /minecraft
RUN wget https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar

# Runs the server once so the eula.txt file exists
RUN java -Xms2048M -Xmx2048M -jar server.jar nogui

# Mark the EULA as agreed to
RUN rm eula.txt
RUN echo "eula=true" > eula.txt

# Run the Minecraft server on container start
ENTRYPOINT java -Xms2048M -Xmx2048M -jar server.jar nogui && /bin/bash