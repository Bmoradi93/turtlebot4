#!/bin/sh
# Kill all docker containers
docker kill $(docker ps -q)

# Definitions
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

# Running the container
docker run --runtime=nvidia --privileged --rm -itd -u root --gpus all -v /dev:/dev \
    --volume=$XSOCK:$XSOCK:rw \
    --volume=$XAUTH:$XAUTH:rw \
    --volume=$HOME:$HOME \
    --shm-size=1gb \
    --env="XAUTHORITY=${XAUTH}" \
    --env=TERM=xterm-256color \
    --env=QT_X11_NO_MITSHM=1 \
    --env=DISPLAY \
    --env=NVIDIA_VISIBLE_DEVICES=all \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="/home/$USER/git/turtlebot4:/root/turtlebot4" \
    --net=host \
    --env=NVIDIA_VISIBLE_DEVICES=all \
    --env=NVIDIA_DRIVER_CAPABILITIES=all \
    --env=QT_X11_NO_MITSHM=1 \
    --runtime=nvidia \
    --name=turtlebot4\
    turtlebot4:latest \
    bash

# Enter the container
sleep 2
docker exec -it turtlebot4 bash