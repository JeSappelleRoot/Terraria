FROM debian:10

ARG server_version="143"
ARG tshock_url="https://github.com/Pryaxis/TShock/releases/download/v4.5.5/TShock4.5.5_Terraria_1.4.2.3.zip"
ARG terraria_home="/home/terraria"
ENV terraria_home=${terraria_home}

RUN adduser --shell /bin/false --home /home/terraria --disabled-password --disabled-login --gecos "" terraria && \
apt-get update && apt-get install unzip wget -y && \
rm -fr /var/cache/apt/* && \
wget https://terraria.org/api/download/pc-dedicated-server/terraria-server-${server_version}.zip -O /tmp/terraria.zip && \
wget ${tshock_url} -O /tmp/tshock.zip && \
unzip /tmp/terraria.zip -d ${terraria_home}/ && \
unzip /tmp/tshock.zip -d ${terraria_home}/${server_version}/ && \
rm /tmp/*.zip


COPY data/ ${terraria_home}/

RUN chown -R terraria:terraria ${terraria_home} && \
chmod -R 750 ${terraria_home}

USER terraria
ENTRYPOINT ["sh", "-c"]
CMD [ "$HOME/143/Linux/TerrariaServer.bin.x86_64 -config /home/terraria/config -steam" ]

