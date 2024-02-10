# SteamCMD in a docker with some basic things installed
# 
# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0
#
# CI/CD build Feb-10-2024

FROM debian:bookworm-slim AS builder

ADD https://media.steampowered.com/client/steamcmd_linux.tar.gz /steam/steamcmd_linux.tar.gz

WORKDIR /steam
RUN \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm /steam/steamcmd_linux.tar.gz

FROM debian:bookworm-slim

# Some dependencies required for steamcmd to work
RUN \
    apt-get update && \
    apt-get install -y screen=4.9.0-4 lib32gcc-s1=12.2.0-14 libc6-i386=2.36-9+deb12u4 ca-certificates=20230311 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /steam /steam

CMD ["/steam/steamcmd.sh"]