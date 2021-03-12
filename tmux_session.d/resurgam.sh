newsession()
{
	session="$1"
	tmux new-session -ds "$session"
	tmux new-window -t "${session}:9" -n adm
	tmux set-option -t "$session" status-style "bg=blue,fg=blue"
}
