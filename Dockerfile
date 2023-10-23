# SteamCMD in a docker with some basic things installed
# 
# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

FROM debian:bookworm-slim AS builder

ADD https://media.steampowered.com/client/steamcmd_linux.tar.gz /steam/steamcmd_linux.tar.gz

RUN \
    cd /steam && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm /steam/steamcmd_linux.tar.gz

FROM debian:bookworm-slim

# Some dependencies required for steamcmd to work
RUN \
    apt update && \
    apt install -y screen lib32gcc-s1 libc6-i386 ca-certificates && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /steam /steam

CMD /steam/steamcmd.sh