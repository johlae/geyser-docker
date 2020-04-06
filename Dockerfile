FROM adoptopenjdk:8-jre-hotspot
VOLUME /data
EXPOSE 19132

ARG JAR_FILE=Geyser.jar
ARG BUILD_TYPE=lastSuccessfulBuild

ENV JAR_FILE $JAR_FILE

# Java Start Options
ENV INIT_MEMORY "1024M"
ENV MAX_MEMORY "1024M"

# this will force a config rewrite every time
ENV OVERWRITE_CONFIG "no"

# Bedrock server config
ENV BEDROCK_ADDRESS "0.0.0.0"
ENV BEDROCK_PORT "19132"
ENV BEDROCK_MOTD1 "GeyserMC"
ENV BEDROCK_MOTD2 "Another GeyserMC forced host."

# Remote Server Config (java server)
ENV REMOTE_ADDRESS: "127.0.0.1"
ENV REMOTE_PORT "25565"
ENV REMOTE_AUTH_TYPE "online"

# Ignore if not using floodgate
ENV GEYSER_FLOODGATE_KEY_FILE "public-key.pem"

# Geyser General Config
ENV GEYSER_PING_PASSTHROUGH "true"
ENV GEYSER_MAX_PLAYER "100"
ENV GEYSER_DEBUG "false"
ENV GEYSER_GENERAL_THREAD_POOL "32"
ENV GEYSER_ALLOW_THIRD_PARTY_CAPES "true"

# Geyser Metrics Config
ENV GEYSER_METRICS_ENABLED "false"
ENV GEYSER_METRICS_UUID; "generateduuid"


## Example source urls
# https://ci.nukkitx.com/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/bukkit/target/Geyser-Bukkit.jar
# https://ci.nukkitx.com/job/GeyserMC/job/Geyser/job/master/lastStableBuild/artifact/bootstrap/bukkit/target/Geyser-Bukkit.jar
# https://ci.nukkitx.com/job/GeyserMC/job/Geyser/job/master/lastStableBuild/artifact/bootstrap/bungeecord/target/Geyser-BungeeCord.jar
# https://ci.nukkitx.com/job/GeyserMC/job/Geyser/job/master/lastStableBuild/artifact/bootstrap/standalone/target/Geyser.jar

ADD https://ci.nukkitx.com/job/GeyserMC/job/Geyser/job/master/$BUILD_TYPE/artifact/bootstrap/standalone/target/$JAR_FILE /opt/$JAR_FILE

COPY start.sh /usr/local/bin/start.sh
COPY config.yml.template /opt/config.yml.template

CMD /bin/bash /usr/local/bin/start.sh
