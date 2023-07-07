# SteamCMD in a docker with some basic things installed
# 
# Author: Chuck Findlay <chuck@findlayis.me>
# License: LGPL v3.0

FROM debian:bookworm-slim

RUN \
    apt update && \
    apt install -y screen lib32gcc-s1 libc6-i386 ca-certificates

ADD http://media.steampowered.com/client/steamcmd_linux.tar.gz /steam/steamcmd_linux.tar.gz

RUN \
    cd /steam && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm /steam/steamcmd_linux.tar.gz

CMD /steam/steamcmd.sh