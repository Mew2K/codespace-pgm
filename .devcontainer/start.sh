#!/usr/bin/env sh

# Define working directory
WORKDIR="/minecraft-server"

# Ensure directory exists
mkdir -p "$WORKDIR"
cd "$WORKDIR"

# Define PaperMC Project
PROJECT="paper"

# Fetch latest version
LATEST_VERSION=$(curl -s "https://api.papermc.io/v2/projects/${PROJECT}" | jq -r '.versions[-1]')
LATEST_BUILD=$(curl -s "https://api.papermc.io/v2/projects/${PROJECT}/versions/${LATEST_VERSION}" | jq -r '.builds[-1]')

# Construct the download URL
JAR_URL="https://api.papermc.io/v2/projects/${PROJECT}/versions/${LATEST_VERSION}/builds/${LATEST_BUILD}/downloads/${PROJECT}-${LATEST_VERSION}-${LATEST_BUILD}.jar"

# Download if not exists
if [ ! -f "server.jar" ]; then
    echo "Downloading PaperMC Server (Version: $LATEST_VERSION, Build: $LATEST_BUILD)..."
    wget -O server.jar "$JAR_URL"
fi

# Accept EULA
echo "eula=true" > eula.txt

# Start server in screen session
echo "Starting Minecraft Server..."
screen -dmS mc-server java -Xms1G -Xmx2G -jar server.jar nogui

echo "Minecraft server (Paper $LATEST_VERSION - Build $LATEST_BUILD) is now running in a screen session!"