# [pwncrack](https://pwncrack.org) Docker (Nvidia)
## About
This docker container runs latest the help_crack.py from the [pwncrack](https://github.com/Terminatoror/pwncrack-addons/blob/main/help_crack.py), a "Distributed WPA PSK auditor". The docker container utilizes the ubuntu 22.04 hashcat binary.

The docker container currently only supports NVIDIA GPUs. Feel free to PR support for AMD 

## Prerequisites:
You need the `NVIDIA Container Toolkit` in order to run this container.
First install it from [HERE](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installation) and restart your docker daemon `sudo systemctl restart docker` 
# Installing methods:

## Install from Dockerhub (recommended)
```
docker pull jakami/pwncrack-docker-nvidia:latest
docker run -it --gpus all -v $HOME/.docker-data/pwncrack-docker:/app/data -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all -e USERKEY="CHANGEME jakami/pwncrack-docker-nvidia:latest
```
## Docker Compose build and run
```
git clone https://github.com/JAKAMI99/pwncrack-docker-nvidia.git
cd pwncrack-docker-nvidia
docker-compose build
docker-compose up
```
## Manual build and run
```
git clone https://github.com/JAKAMI99/pwncrack-docker-nvidia
cd pwncrack-docker-nvidia
docker build -t jakami/pwncrack-docker-nvidia:latest .
docker run -it --gpus all -v $HOME/.docker-data/pwncrack-docker:/app/data -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all -e USERKEY="CHANGEME" jakami/pwncrack-docker-nvidia:latest
```
pwnamap
## Potfile
When using the supplied run command or the Docker Compose file, the container will put a file "cracked.pot" into the data directory which gets mounted at `$HOME/.docker-data/pwncrack-docker`. The file will store all your loot :3
