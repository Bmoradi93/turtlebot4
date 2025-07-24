# TurtleBot4 Development Environment

A comprehensive ROS2-based robotics platform built on the iRobot Create3 base with custom TurtleBot4 modifications.

## 📋 Overview

TurtleBot4 is a powerful educational and research robotics platform that combines:
- **iRobot Create3** as the base platform
- **ROS2 Humble** for modern robotics development
- **Gazebo/Ignition** for simulation
- **OAK-D Pro** for 3D vision and AI
- **RPLidar** for 2D laser scanning
- **Navigation2** for autonomous navigation
- **SLAM Toolbox** for mapping and localization

## 🚀 Quick Start

```bash
# Show all available commands
make help

# Complete development setup (build, start, enter container)
make dev

# Or step by step:
make build    # Build Docker image
make start    # Start container
make enter    # Enter container
```

## 🐳 Docker Management

### Image Management
- `make build` - Build the TurtleBot4 Docker image
- `make build-no-cache` - Build without using cache (clean build)
- `make pull` - Pull latest image from registry (if available)

### Container Management
- `make start` - Start the TurtleBot4 container
- `make enter` - Enter the running container
- `make stop` - Stop the container
- `make restart` - Restart the container
- `make status` - Show container and image status
- `make logs` - Show container logs

### Cleanup
- `make clean` - Remove stopped containers and unused images
- `make clean-all` - Remove ALL containers and images (WARNING: destructive)
- `make reset` - Stop, clean, and restart

## 🔧 Development Commands

### Workspace Building
- `make build-workspace` - Build the ROS2 workspace inside container
- `make build-workspace-parallel` - Build with parallel jobs (faster)

### ROS1 Bridge
- `make ros1-bridge` - Start ROS1 bridge in tmux session

## 🎮 Simulation Commands

- `make sim` - Launch TurtleBot4 simulation (default: lite model)
- `make sim-standard` - Launch simulation with standard model
- `make sim-warehouse` - Launch simulation in warehouse world

## ⚡ Convenience Commands

- `make quick-start` - Build image and start container
- `make dev` - Complete development setup (build, start, enter)
- `make info` - Show system information and requirements

## 📖 Usage Examples

### First Time Setup
```bash
# Build the Docker image (this may take a while)
make build

# Start the container
make start

# Enter the container
make enter
```

### Daily Development Workflow
```bash
# Start your development session
make dev

# Inside the container, build the workspace
make build-workspace

# Launch simulation
make sim
```

### Working with Simulation
```bash
# Launch simulation with standard model in warehouse
make sim-warehouse

# Or launch with standard model
make sim-standard
```

### Troubleshooting
```bash
# Check container status
make status

# View container logs
make logs

# Reset everything if something goes wrong
make reset
```

## 🏗️ Project Structure

```
turtlebot4/
├── docker/                 # Docker configuration
│   ├── Dockerfile         # Main Docker image definition
│   └── cyclonedds.xml     # DDS configuration
├── ros2_ws/               # ROS2 workspace
│   └── src/
│       ├── create3_sim/           # iRobot Create3 simulation
│       ├── irobot_create_msgs/    # Create3 message definitions
│       ├── turtlebot4_robot/      # Real robot packages
│       ├── turtlebot4_simulator/  # Simulation packages
│       ├── turtlebot4_description/ # Robot models and URDF
│       ├── turtlebot4_navigation/  # Navigation configuration
│       ├── turtlebot4_msgs/       # Custom messages
│       └── urg_node2/             # RPLidar driver
├── scripts/               # Utility scripts
├── Makefile              # Development automation
└── dependencies.repos    # External dependencies
```

## 🔧 System Requirements

- **Docker** with NVIDIA runtime support
- **X11 forwarding** capability
- **NVIDIA GPU drivers** (for simulation)
- **Make utility**
- **Ubuntu 22.04** (Jammy) or compatible system

## 📦 What's Included

### Core Components
- **ROS2 Humble** with desktop packages
- **TurtleBot4 packages** (all variants)
- **iRobot Create3 packages** (base platform)
- **Navigation2** stack
- **SLAM Toolbox**
- **DepthAI packages** for OAK-D camera
- **RPLidar packages**
- **Development tools** (vim, tmux, etc.)
- **CycloneDDS** configuration for ROS2 communication

### Hardware Support
- **OAK-D Pro**: 3D camera for depth sensing and AI
- **RPLidar**: 2D laser scanner for SLAM and navigation
- **Custom Tower**: Modular sensor mounting system
- **User Interface**: Buttons, display, and LED indicators

### Simulation Capabilities
- **Multiple Worlds**: Warehouse, maze, depot environments
- **GUI Plugins**: Custom TurtleBot4 interface in Gazebo
- **ROS-Gazebo Bridge**: Seamless communication between ROS and simulation

## 🚨 Troubleshooting

### Container won't start
- Check if Docker is running: `sudo systemctl status docker`
- Check if NVIDIA runtime is available: `docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi`

### X11 forwarding issues
- Make sure X11 forwarding is enabled: `echo $DISPLAY`
- Try running: `xhost +local:docker`

### Permission issues
- Make sure your user is in the docker group: `groups $USER`
- If not, add yourself: `sudo usermod -aG docker $USER`

### Out of disk space
- Clean up Docker resources: `make clean`
- For more aggressive cleanup: `make clean-all` (WARNING: removes everything)

### Build failures
- Check network connectivity
- Try building with `--fix-missing` flag
- Use `make build-no-cache` for clean builds

## 📚 Additional Resources

- [TurtleBot 4 User Manual](https://turtlebot.github.io/turtlebot4-user-manual/software/turtlebot4_packages.html)
- [ROS2 Documentation](https://docs.ros.org/en/humble/)
- [iRobot Create3 Documentation](https://irobot.gitbook.io/create3-docs/)
- [Gazebo Documentation](https://gazebosim.org/docs)

## 🤝 Contributing

This project follows standard ROS2 development practices. Please refer to the [TurtleBot 4 User Manual](https://turtlebot.github.io/turtlebot4-user-manual/software/turtlebot4_packages.html) for detailed development guidelines.

## 📄 License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

## 🏷️ Version Information

- **ROS2 Version**: Humble (Ubuntu 22.04)
- **Base Platform**: iRobot Create3
- **Simulation**: Gazebo/Ignition
- **DDS**: CycloneDDS
- **Last Updated**: 2024
