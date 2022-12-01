#!/bin/sh
session="manual_control"

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session

# Select pane 1, set dir to api, run vim
tmux selectp -t 1
tmux send-keys "source ~/tb_ws/devel/setup.bash && roslaunch rzr_control teleop.launch" C-m

tmux splitw -v -p 50
tmux send-keys "source ~/tb_ws/devel/setup.bash && rosrun topic_tools relay /odom /platform_control/odom" C-m

tmux selectp -t 2
tmux splitw -v -p 50
tmux send-keys "source ~/tb_ws/devel/setup.bash && rosrun topic_tools relay /imu /platform_control/imu" C-m

# tmux selectp -t 2
# tmux splitw -h -p 50
# tmux send-keys "source ~/tb_ws/devel/setup.bash && roslaunch rzr_control robot_localization.launch" C-m

tmux selectp -t 1
tmux splitw -h -p 50
tmux send-keys "source ~/tb_ws/devel/setup.bash && rosrun topic_tools relay /scan /front/scan" C-m
# return to main vim window
tmux select-window -t $session:0

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
