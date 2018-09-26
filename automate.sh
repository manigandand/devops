#!/bin/sh
#
DEPENDENCY_XDOTOOL=xdotool
DEPENDENCY_TMUXINATOR=tmuxinator
# Dependencies:
if ! type "$DEPENDENCY_XDOTOOL" > /dev/null; then
  echo "$DEPENDENCY_XDOTOOL not found. installing it..."
  sudo apt install xdotool
fi
if ! type "$DEPENDENCY_TMUXINATOR" > /dev/null; then
  echo "$DEPENDENCY_TMUXINATOR not found. installing it..."
  sudo apt install tmuxinator
fi

WID= xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| awk '{print $5}'; xdotool windowfocus $WID;
# xdotool key ctrl+shift+t $WID

TMUX_MYWORKSPACE_SESSION_NAME="myworkspace"

if (tmux has-session -t "$TMUX_MYWORKSPACE_SESSION_NAME" 2> /dev/null); then
    echo "Session '$TMUX_MYWORKSPACE_SESSION_NAME' exists."
else
    echo "creating a new session "$TMUX_MYWORKSPACE_SESSION_NAME
    tmux new-session -d -s $TMUX_MYWORKSPACE_SESSION_NAME
    # tmux send-keys -t $TMUX_MYWORKSPACE_SESSION_NAME "echo 'Now:'; while true; do printf '%(%c)T\r'; done" ENTER
    tmux send-keys -t $TMUX_MYWORKSPACE_SESSION_NAME "xdotool key ctrl+b c" C-m
fi

# sleep 1; xdotool type --delay 1 --clearmodifiers 'tmux'; xdotool key Return;
# sleep 1; xdotool type --delay 1 --clearmodifiers 'echo "MYWORKSPACE Window Tab 2"'; xdotool key Return;

# ==================>
# WID= xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| awk '{print $5}'; xdotool windowfocus $WID; xdotool key ctrl+shift+t $WID
# echo "MYWORKSPACE Window Tab 1"
# sleep 1; xdotool type --delay 1 --clearmodifiers 'echo "MYWORKSPACE Window Tab 2"'; xdotool key Return;

# WID= xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)"| awk '{print $5}'; xdotool windowfocus $WID; xdotool key ctrl+shift+t $WID
# sleep 1; xdotool type --delay 1 --clearmodifiers 'echo "MYWORKSPACE Window Tab 3"'; xdotool key Return;

# gnome-terminal --tab --tab

# gnome-terminal --tab -e "bash -c \"echo "hello";exec bash\""