tmux new-session -ds "$session"
tmux new-window -t "${session}:9" -n adm
tmux select-window -t "${session}:1"
