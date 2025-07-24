# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
FROM ros:humble-ros-core-jammy

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    git \
    python3-colcon-common-extensions \
    python3-colcon-mixin \
    python3-rosdep \
    python3-vcstool \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO

# setup colcon mixin and metadata
RUN colcon mixin add default \
      https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml && \
    colcon mixin update && \
    colcon metadata add default \
      https://raw.githubusercontent.com/colcon/colcon-metadata-repository/master/index.yaml && \
    colcon metadata update

# install ros2 packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-ros-base \
    && rm -rf /var/lib/apt/lists/*

RUN rm -rf /etc/apt/sources.list.d/ros2.list

RUN apt-get update && apt-get install vim tmux iproute2 locales software-properties-common curl gnupg2 lsb-release -y

RUN locale-gen en_US en_US.UTF-8

RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN export LANG=en_US.UTF-8

RUN add-apt-repository universe

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# ROS1 repository not needed for Humble + Jammy

RUN rm -rf /etc/apt/sources.list.d/ros2.list

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --fix-missing ros-humble-desktop python3-argcomplete || (apt-get update && apt-get install -y --fix-missing ros-humble-desktop python3-argcomplete)

# RUN apt-get update && apt-get install -y --fix-missing ros-humble-ros1-bridge ros-humble-control-msgs || (apt-get update && apt-get install -y --fix-missing ros-humble-ros1-bridge ros-humble-control-msgs) 

# Simulator installation 
# RUN apt-get update && sudo apt-get install wget
# RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
# RUN wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
# RUN apt-get update && apt-get install -y --fix-missing ignition-garden || (apt-get update && apt-get install -y --fix-missing ignition-garden)

ADD docker/cyclonedds.xml /etc/cyclonedds.xml

RUN echo "export ROS_DOMAIN_ID=0" >> ~/.bashrc
RUN echo "export CYCLONEDDS_URI=/etc/cyclonedds.xml" >> ~/.bashrc
RUN echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

RUN echo "export ROS_MASTER_URI=http://172.17.0.1:11311" >> ~/.bashrc
RUN echo "export ROS_HOSTNAME=172.17.0.1" >> ~/.bashrc
RUN echo "export ROS_IP=172.17.0.1" >> ~/.bashrc

