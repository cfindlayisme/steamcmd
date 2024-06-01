# What is this?
This is steamcmd in a docker container. I use it as a base image for game servers I can install from steam.

Nothing particuarly special about it, but it's great to speed me along and keep the logic of downloading steamcmd & installing required libs to keep it running in one place.

# How to use this?
Do something like

```dockerfile
FROM ghcr.io/cfindlayisme/steamcmd:latest

# Install your game server
RUN /steam/steamcmd.sh +force_install_dir /satisfactory +login anonymous +app_update 1690800 -beta public validate +quit
```

This would install satisfactory. You'd have to check where steamcmd puts your specific game to make a proper entrypoint script, but that's otherwise the gist of it.

# Automated build
This re-builds once a week on its own. steamcmd gets regular updates so this just re-pulls and re-builds, tagging as latest so my CI has fresh copies of the image to work with.