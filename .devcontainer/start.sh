# Define PaperMC Project
PROJECT="paper"

# Get the latest Minecraft version supported by PaperMC
LATEST_VERSION=$(curl -s https://api.papermc.io/v2/projects/${PROJECT} | jq -r '.versions[-1]')

# Get the latest build for that version
LATEST_BUILD=$(curl -s "https://api.papermc.io/v2/projects/${PROJECT}/versions/${LATEST_VERSION}" | jq -r '.builds[-1]')

# Construct the download URL
JAR_URL="https://api.papermc.io/v2/projects/${PROJECT}/versions/${LATEST_VERSION}/builds/${LATEST_BUILD}/downloads/${PROJECT}-${LATEST_VERSION}-${LATEST_BUILD}.jar"

# Check if the server jar exists, if not, download it
if [ ! -f "server.jar" ]; then
    echo "Downloading PaperMC Server (Version: $LATEST_VERSION, Build: $LATEST_BUILD)..."
    wget -O server.jar "$JAR_URL"
fi

# Accept EULA
echo "eula=true" > eula.txt

# Start the server in a screen session
echo "Starting Minecraft Server..."
screen -dmS mc-server java -Xms1G -Xmx2G -jar server.jar nogui

# Print success message
echo "Minecraft server (Paper $LATEST_VERSION - Build $LATEST_BUILD) is now running in a screen session!"