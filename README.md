# SteamCMD Dockerfile

This Dockerfile installs the **SteamCmd** in a linux environment like `Ubuntu`. It exposes multiple environment variables:

* `STEAM_USER`: This is the user that will be created to make the installation.
* `WD`: The user working directory  
* `STEAM_DIR`: This is the directory where the files will be downloaded. It is created inside the `WD`
* `HIDDEN_DIR`: Where the `steamclient.so` will be copied

For default the `WORKDIR` is set to `WD`.

## Dependencies
This `Dockerfile` install for default the next dependencies:
* `curl`
* `ca-certificates`
* `lib32gcc1`
* `binutils`

The base is the `ubuntu:latest` 

## Build
To create the image just run 
```bash
docker build -t steamcmd .
```
This process can take a while. When the process is finished, check your images
```bash
docker images
```
The image is around `318MB`