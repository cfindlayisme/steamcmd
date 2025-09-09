# SteamCMD in a docker with some basic things installed
# 
# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

FROM debian:12.12-slim AS builder

ADD https://media.steampowered.com/client/steamcmd_linux.tar.gz /steam/steamcmd_linux.tar.gz

WORKDIR /steam
RUN \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm /steam/steamcmd_linux.tar.gz

FROM debian:12.12-slim

# Some dependencies required for steamcmd to work
RUN \
    apt-get update && \
    apt-get install -y screen lib32gcc-s1 libc6-i386 ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /steam /steam

CMD ["/steam/steamcmd.sh"]