newsession()
{
	session="$1"
	tmux new-session -ds "$session"
	tmux new-window -t "${session}:9" -n sysmgmt
	tmux set-option -t "$session" status-style "fg=white,bg=black"
}
