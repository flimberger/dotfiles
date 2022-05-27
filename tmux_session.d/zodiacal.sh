tmux new-session -ds "$session"
tmux new-window -t "${session}:8" -n cfg -c lib/cfg
tmux new-window -t "${session}:9" -n adm
