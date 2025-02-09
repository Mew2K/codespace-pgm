FROM ubuntu:22.04

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y openjdk-21-jdk wget screen jq curl && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /minecraft-server

# Expose the Minecraft server port
EXPOSE 25565