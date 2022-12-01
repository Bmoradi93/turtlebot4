#!/bin/sh
session="rosbridg"

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session

# Select pane 1, set dir to api, run vim
tmux selectp -t 1
tmux send-keys "source /opt/ros/noetic/setup.bash && source /opt/ros/galactic/setup.bash && ros2 run ros1_bridge dynamic_bridge --bridge-all-topics" C-m

# Split pane 1 horizontal by 65%, start redis-server
tmux splitw -h -p 50
tmux send-keys "source /opt/ros/noetic/setup.bash && roscore" C-m

# Select pane 2 
tmux selectp -t 2
# Split pane 2 vertiacally by 25%
tmux splitw -v -p 50

# select pane 3, set to api root
tmux selectp -t 3
tmux send-keys "" C-m

# Select pane 1
tmux selectp -t 1


# return to main vim window
tmux select-window -t $session:0

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
