FROM ubuntu:20.04

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget screen jq && \
    rm -rf /var/lib/apt/lists/*

# Install OpenJDK 21
RUN wget https://download.java.net/java/GA/jdk21/0d5cf1c7fbbf4c30a1d4b0a0d6f5d0a8/21/GPL/openjdk-21_linux-x64_bin.tar.gz && \
    tar -xzf openjdk-21_linux-x64_bin.tar.gz -C /opt && \
    rm openjdk-21_linux-x64_bin.tar.gz && \
    ln -s /opt/jdk-21/bin/java /usr/bin/java

# Set the working directory
WORKDIR /minecraft-server

# Expose the Minecraft server port
EXPOSE 25565