FROM debian:10

# Build args with default values
ARG server_version="1431"
ARG tshock_url="https://github.com/Pryaxis/TShock/releases/download/v4.5.5/TShock4.5.5_Terraria_1.4.2.3.zip"
ARG terraria_home="/home/terraria"

# Environment variable for runtime based on build arg
ENV TERRARIA_VERSION=${server_version}

# Main image crafting steps
RUN adduser --shell /bin/false --home /home/terraria --disabled-password --disabled-login --gecos "" terraria && \
apt-get update && apt-get install unzip wget -y && \
rm -fr /var/cache/apt/* && \
wget https://terraria.org/api/download/pc-dedicated-server/terraria-server-${server_version}.zip -O /tmp/terraria.zip && \
wget ${tshock_url} -O /tmp/tshock.zip && \
unzip /tmp/terraria.zip -d ${terraria_home}/ && \
unzip /tmp/tshock.zip -d ${terraria_home}/${server_version}/ && \
rm /tmp/*.zip

# Copy data to Terraria home folder
COPY data/ ${terraria_home}/

# Change owner of files
RUN chown -R terraria:terraria ${terraria_home} && \
chmod -R 750 ${terraria_home}

# Switch to terraria dedicated user
USER terraria

# Change entrypoint
ENTRYPOINT ["sh", "-c"]
# Custom command to start Terraria CLI in foreground and have direct CLI
CMD [ "$HOME/$TERRARIA_VERSION/Linux/TerrariaServer.bin.x86_64 -config /home/terraria/config -steam" ]
