FROM eclipse-temurin:17
VOLUME /data
EXPOSE 19132

ARG BUILD_TYPE=lastSuccessfulBuild

# Java Start Options
ENV INIT_MEMORY "1024M"
ENV MAX_MEMORY "1024M"

# this will force a config rewrite every time
ENV OVERWRITE_CONFIG "no"

# Bedrock server config
ENV BEDROCK_ADDRESS "0.0.0.0"
ENV BEDROCK_PORT "19132"
ENV BEDROCK_MOTD1 "JohnsGeyserMC"
ENV BEDROCK_MOTD2 "Ubutuserver GeyserMC forced host."

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

RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

# John addd 
RUN mkdir /opt/geysersource
ADD https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone /opt/geysersource

RUN java -jar /opt/Geyser-Standalone.jar /opt/geysersource

COPY start.sh /usr/local/bin/start.sh
COPY config.yml.template /opt/config.yml.template

CMD /bin/bash /usr/local/bin/start.sh
