# Base image
FROM ubuntu

# Install the required dependencies
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    lib32gcc1 \
    binutils

# Create the user and checkout it
ENV STEAM_USER steam
RUN useradd -ms /bin/bash $STEAM_USER
USER $STEAM_USER

# Set the working directory
ENV WD /home/$STEAM_USER
WORKDIR $WD

# Create the steam directory and download the SteamCMD into it
ENV STEAM_DIR steamcmd
RUN mkdir -p $STEAM_DIR && \
    curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | \
    tar -C $STEAM_DIR -zxv

# Install the steam cmd
RUN $STEAM_DIR/steamcmd.sh +login anonymous +quit

# Bugfix, for default when the game server is started, it searches 
# where the steam client is (for default search in the .steam/sdk32
# directory
ENV HIDDEN_DIR $WD/.steam/sdk32
RUN mkdir -p $HIDDEN_DIR
RUN cp $STEAM_DIR/linux32/steamclient.so $HIDDEN_DIR
