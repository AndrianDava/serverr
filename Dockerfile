# Use the official PocketMine-MP image
FROM openjdk:8-jdk-alpine

# Install necessary packages
RUN apk add --no-cache curl bash libstdc++ \
&& curl -L -o /tmp/PocketMine-MP.phar https://github.com/pmmp/PocketMine-MP/releases/latest/download/PocketMine-MP.phar \
&& mkdir -p /server \
&& mv /tmp/PocketMine-MP.phar /server/PocketMine-MP.phar

# Set working directory
WORKDIR /server

# Copy start script to container
COPY start.sh /server/start.sh
RUN chmod +x /server/start.sh

# Expose default Minecraft Bedrock port
EXPOSE 19132/udp

# Start PocketMine-MP
CMD ["/bin/bash", "/server/start.sh"]
