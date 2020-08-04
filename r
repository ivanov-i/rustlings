#!/usr/bin/env sh

cd ~/rust/rustlings/
tmux start-server
session="rustlings"

# Check if the session exists, discarding output
# We can check $? for the exit status (zero for success, non-zero for failure)
tmux has-session -t $session 2>/dev/null

if [ $? != 0 ]; then
		echo creating session
		tmux new -d -s $session "rustlings watch"
		tmux split-window -h -t $session:1 nvim
else
		echo attaching to the existing sessing
fi

# Attach to created session
tmux attach-session  -t $session
